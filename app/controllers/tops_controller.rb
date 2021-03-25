class TopsController < ApplicationController
  before_action :Login_conf

  def index
  end

  private

  def Login_conf
    if user_signed_in?
      redirect_to tweets_path
    end
  end

end
