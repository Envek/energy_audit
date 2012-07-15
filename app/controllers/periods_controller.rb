class PeriodsController < ApplicationController
  before_filter :load_periods

  def index
  end

  def show
    @period = Period.from_param(params[:id])
    render 'index'
  end

protected

  def load_periods
    if current_user and (current_user.admin or current_user.subjects.any?)
      @periods = Period.all
    else
      @periods = Period.published
    end
  end

end
