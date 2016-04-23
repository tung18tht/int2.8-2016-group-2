class MatchesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  # def index
  #   @users = User.all
  #   @matches_count = 0
  #   @users.each do |user|
  #     next if user.id == current_user.id
  #     if current_user.likes?(user) && user.likes?(current_user)
  #       @matches_count += 1
  #     end
  #   end
  # end
  def index
    @users = current_user.likers(User)  #These are people who liked me (aka current_user)
    @matches_count = 0
    @users.each do |user|
      if current_user.likes?(user) 
        @matches_count += 1
      end
    end
  end

  def unlike_user
        @user = User.find(params[:id])
        current_user.unlike!(@user)
        redirect_to matches_path
  end
  
end
