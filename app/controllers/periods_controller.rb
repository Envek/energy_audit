class PeriodsController < ApplicationController

  def index
    @periods = Period.published
  end

  def show
    @periods = Period.published
    @period = Period.from_param(params[:id])
    render 'index'
  end

end
