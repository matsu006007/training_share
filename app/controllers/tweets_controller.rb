class TweetsController < ApplicationController
  before_action :Login_check

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  private

  def Login_check
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
