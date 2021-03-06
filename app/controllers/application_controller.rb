class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :banned?

  before_action :set_locale_and_theme

  protected

  def banned?
    if current_user && current_user.banned
      sign_out current_user
      flash[:error] = "This account has been banned"
      root_path
    end
  end

  def set_locale_and_theme
    if current_user
      I18n.locale = current_user.locale
      @theme = current_user.theme
    else
      I18n.locale = I18n.default_locale
      @theme = "light"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:login, :email, :password, :current_password])
  end

end
