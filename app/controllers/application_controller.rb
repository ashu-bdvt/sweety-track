class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include Pundit
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  #Override devise's create/update params to allow custom params
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :date_of_birth, :type, :contact_number, :address, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :date_of_birth, :type, :contact_number, :address, :email, :password, :current_password, :is_female, :date_of_birth) }
  end
end