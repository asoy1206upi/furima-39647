class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller? 

  
  private
  def configure_permitted_parameters
    authenticate_or_request_with_http_basic do |username, password|
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])  
      username == 'admin' && password == '2222'
    end
  end
end
