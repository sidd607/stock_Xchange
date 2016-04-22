class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  respond_to :html, :json
  layout false
  protected

  layout "application"
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :college, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :college, :password,:password_confirmation, :current_password, :is_female, :date_of_birth) }
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || '/dashboard'
  end
end
