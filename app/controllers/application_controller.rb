class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    tweets_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    user_path(current_user)
  end


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :comment, :target, :image, :prefecture_id, :training_frequency_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :comment, :target, :image, :prefecture_id, :training_frequency_id])
  end
end
