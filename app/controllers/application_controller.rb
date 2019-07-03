class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def default_url_options
    options = {}
    options[:lang] = I18n.locale unless I18n.default_locale == I18n.locale
    options
  end

  protected

  def configure_permitted_parameters
    attributes = [:name, :lastname]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "#{t('application.header.welcome')}, #{resource.name} #{resource.lastname}!"
    if resource.class == Admin
      admin_tests_path
    elsif resource.class == User
      root_path
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
