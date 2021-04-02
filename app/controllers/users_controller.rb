class UsersController < ApplicationController
  before_action :Login_check

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweet.order("created_at DESC").page(params[:page]).per(5)
  end
end

private

def Login_check
  unless user_signed_in?
    redirect_to root_path
  end
end
