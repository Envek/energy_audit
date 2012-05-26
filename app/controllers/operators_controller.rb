class OperatorsController < ApplicationController
  before_filter :authenticate_operator!
  before_filter :set_default_period_and_subject_if_needed
  before_filter :load_period_and_subject
  
  private

  def set_default_period_and_subject_if_needed
    session[:period] = Period.first if session[:period].nil?
    session[:subject] = current_operator.subjects.first if current_operator and session[:subject].nil?
  end

  def load_period_and_subject
    @period = session[:period]
    @subject = session[:subject]
  end

end
