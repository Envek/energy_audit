class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :user_signed_in?
  def user_signed_in?
    admin_signed_in? || auditor_signed_in? || operator_signed_in?
  end

  helper_method :current_user
  def current_user
    current_admin || current_auditor || current_operator
  end
end
