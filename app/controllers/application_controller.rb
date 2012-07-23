class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def current_ability
    @current_ability ||= Ability.new(current_user, params)
  end

end
