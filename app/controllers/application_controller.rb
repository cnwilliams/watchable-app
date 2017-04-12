class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || root_path
  end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:first_name, :last_name, :email, :avatar, :password, :password_confirmation)
    end
  end
end
