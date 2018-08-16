# ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protected
    def configure_permitted_parameters
    added_params = [:user_name, :email, :password, :password_confirmation,:avatar]
    devise_parameter_sanitizer.permit :user_update, keys: added_params
    end

end
