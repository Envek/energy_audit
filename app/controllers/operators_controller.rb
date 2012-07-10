class OperatorsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_default_period_and_subject_if_needed
  before_filter :load_period_and_subject
  
  private

  def set_default_period_and_subject_if_needed
    session[:period] = Period.first if session[:period].nil?
    session[:subject] = current_user.subjects.first if current_user and session[:subject].nil?
  end

  def load_period_and_subject
    @period = params[:period_id] ? Period.from_param(params[:period_id]) : session[:period]
    @subject = params[:subject_id] ? Subject.find(params[:subject_id]) : session[:subject]
  end

end
