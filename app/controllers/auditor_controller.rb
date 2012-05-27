class AuditorController < ApplicationController
  before_filter :authenticate_auditor!
  before_filter :set_default_period_if_needed
  before_filter :load_period_and_subject
  
  private

  def set_default_period_if_needed
    session[:period] = Period.first if session[:period].nil?
  end

  def load_period_and_subject
    @period = session[:period]
  end

end
