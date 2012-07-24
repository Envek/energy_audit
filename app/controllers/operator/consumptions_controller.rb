class Operator::ConsumptionsController < OperatorsController

  def index
    @consumptions = Consumption.with_resource.where(:period_id => @period.id, :subject_id => @subject.id)
  end

  def new
    authorize! :create, Consumption
    @consumption = Consumption.new(:period => @period, :subject => @subject)
  end

  def create
    authorize! :create, Consumption
    unless Consumption.where(:period_id => @period.id, :subject_id => @subject.id, :resource_id => params[:consumption][:resource_id]).any?
      value = Consumption.new(:period => @period, :subject => @subject)
      value.update_attributes(params[:consumption])
      value.save
      redirect_to url_for(:action => :index), :notice => t("operator.consumptions.messages.saved")
    else
      redirect_to url_for(:action => :index), :error => t("operator.consumptions.messages.already_exists")
    end
  end

  def edit
    @consumption = Consumption.find(params[:id])
    authorize! :update, @consumption
  end

  def update
    value = Consumption.find(params[:id])
    value.update_attributes(params[:consumption])
    authorize! :update, value
    value.save!
    redirect_to url_for(:action => :index), :notice => t("operator.consumptions.messages.saved")
  end

  def destroy
    value = Consumption.find(params[:id])
    authorize! :delete, value
    value.destroy
    redirect_to url_for(:action => :index), :notice => t("operator.consumptions.messages.removed")
  end

end
