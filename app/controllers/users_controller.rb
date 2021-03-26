class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end
end
