class TopsController < ApplicationController
  before_action :Login_conf

  def index
  end

  private

  def Login_conf
    redirect_to tweets_path if user_signed_in?
  end
end
