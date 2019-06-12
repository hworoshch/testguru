class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:name, :lastname]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Welcome, #{resource.name} #{resource.lastname}!"
    if resource.class == Admin
      admin_tests_path
    elsif resource.class == User
      root_path
    end
  end
end
