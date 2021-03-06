class ApplicationController < ActionController::Base
  include Pundit
  # after_action :verify_authorized, unless: :devise_controller?, except: :index
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  before_action :authenticate_user!

   rescue_from Pundit::NotAuthorizedError do |e|
     flash[:danger] = "NO!"
     redirect_to "/users/sign_in"
   end

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
   end
end
