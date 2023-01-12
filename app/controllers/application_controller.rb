# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :redirect_to_username_form, if: -> { user_signed_in? && current_user.username.blank? }

  protected

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def redirect_to_username_form
    redirect_to new_username_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
