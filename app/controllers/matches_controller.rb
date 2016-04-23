class MatchesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @users = User.all
    @matches_count = 0
    @users.each do |user|
      next if user.id == current_user.id
      if current_user.likes?(user) && user.likes?(current_user)
        @matches_count += 1
      end
    end
  end

  def show
  end
end
