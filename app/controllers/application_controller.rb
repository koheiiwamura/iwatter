class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :username, :email, :visibility])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :password])
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
