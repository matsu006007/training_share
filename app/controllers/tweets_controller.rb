class TweetsController < ApplicationController
  before_action :Login_check
  before_action :one_tweet, only: [:show, :edit, :update, :destroy] 

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(10)
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
  end

  def edit
    if current_user == @tweet.user
      render :edit
    else
      redirect_to tweets_path
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet.id)
    else
      @tweet = Tweet.new(tweet_params)
      render :edit
    end
  end

  def destroy
    if @tweet.destroy
      redirect_to user_path(@tweet.user_id)
    end
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

  def one_tweet
    @tweet = Tweet.find(params[:id])
  end

end
