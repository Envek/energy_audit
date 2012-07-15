class AuditorController < ApplicationController
  before_filter :load_period
  
  private

  def load_period
    @period = Period.from_param(params[:period_id])
  end

end
