class UsersController < ApplicationController
    def index
        @users = User.all
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
