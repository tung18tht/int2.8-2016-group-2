class UsersController < ApplicationController
    def index
        @users = User.all
        unless current_user.nil? || current_user.profile.nil?
            @this_user_interests = current_user.profile.interest.split(";")
            @common_interest = Hash.new(0)
            @users.each do |user|
                if user.id == current_user.id || user.profile.nil? || current_user.likes?(user) || current_user.follows?(user)
                    @users -= [user]
                    next
                end
                @other_user_interests = user.profile.interest.split(";")
                @common_interest[user.id] = (@this_user_interests & @other_user_interests).size
            end
            @users.sort_by! {|user| -@common_interest[user.id]}
        end
    end
    
    def show
        @user = User.find(params[:id])
        @user_posts = @user.posts
        @profile = @user.profile
    end
    
    def like_user
        @user = User.find(params[:id])
        current_user.like!(@user)
        redirect_to users_path
    end
    
    def superlike_user
        @user = User.find(params[:id])
        current_user.follow!(@user)
        redirect_to users_path
    end
end
