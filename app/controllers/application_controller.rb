require "application_responder"

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  end

  def after_sign_in_path(_resource_or_scope)
    home_path(current_user)
  end
end
