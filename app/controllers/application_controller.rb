class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  after_filter :reset_last_captcha_code!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    if request.referer == sign_in_url
      super
    else
      edit_user_registration_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :name, :email, :password, :password_confirmation, :bank_name, :bank_branch, :account_holder, :account_no, :phone_number)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :name, :email, :password, :password_confirmation, :bank_name, :bank_branch, :account_holder, :account_no, :phone_number)
    end
  end
end
