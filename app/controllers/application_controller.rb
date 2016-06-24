class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # include Pundit
  # after_action :verify_authorized

  # rescue_from Pundit::NotAuthorizedError do |e|
  #   flash[:danger] = "NO!"
  #   redirect_to "/"
  # end
end
