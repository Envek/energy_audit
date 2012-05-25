class Operator::ConsumptionsController < OperatorsController
  before_filter :initialize_common_vars

  def index
    @consumptions = Consumption.with_resource.where(:period_id => @period.id, :subject_id => @subject.id)
  end

  def new
    @consumption = Consumption.new(:period => @period, :subject => @subject)
  end

  def create
    unless Consumption.where(:period_id => @period.id, :subject_id => @subject.id, :resource_id => params[:consumption][:resource_id]).any?
      value = Consumption.new(:period => @period, :subject => @subject)
      value.update_attributes(params[:consumption])
      value.save
      redirect_to url_for(:action => :index), :notice => "Saved"
    else
      redirect_to url_for(:action => :index), :error => "Already exists"
    end
  end

  def edit
    @consumption = Consumption.find(params[:id])
  end

  def update
    value = Consumption.find(params[:id])
    value.update_attributes(params[:consumption])
    value.save!
    redirect_to url_for(:action => :index), :notice => "Saved"
  end

  def destroy
    value = Consumption.find(params[:id])
    value.destroy
    redirect_to url_for(:action => :index), :notice => "Removed"
  end

private

  def initialize_common_vars
    @period = session[:period]
    @subject = session[:subject]
  end

end
