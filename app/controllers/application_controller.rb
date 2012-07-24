class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_period_and_subject

private

  def current_ability
    @current_ability ||= Ability.new(current_user, params)
  end

  def load_period_and_subject
    session[:period_id] = params[:period_id] if params[:period_id]
    @period = Period.from_param(session[:period_id]) if session[:period_id]
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    elsif session[:subject_id]
      @subject = Subject.find(session[:subject_id])
    end
  end

end
