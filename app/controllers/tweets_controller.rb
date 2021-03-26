class TweetsController < ApplicationController
  before_action :Login_check

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      @tweet = Tweet.new(tweet_params)
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def Login_check
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def tweet_params
    params.require(:tweet).permit(:title, :genre_id, :content, :image).merge(user_id: current_user.id)
  end

end
