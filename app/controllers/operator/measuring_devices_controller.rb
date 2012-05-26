class Operator::MeasuringDevicesController < OperatorsController

  def index
    @areas = Area.includes(:measuring_devices => :kind).for_period_and_subject(@period, @subject)
  end

  def new
    @device = MeasuringDevice.new(:period_id => @period.id, :subject_id => @subject.id)
  end

  def create
    unless MeasuringDevice.where(:period_id => @period.id, :subject_id => @subject.id,
                                 :area_id => params[:measuring_device][:area_id],
                                 :kind_id => params[:measuring_device][:kind_id],).any?
      device = MeasuringDevice.new(:period => @period, :subject => @subject)
      device.update_attributes(params[:measuring_device])
      device.save
      redirect_to url_for(:action => :index), :notice => t("operator.measuring_devices.messages.saved")
    else
      redirect_to url_for(:action => :index), :error => t("operator.measuring_devices.messages.already_exists")
    end
  end

  def edit
    @device = MeasuringDevice.find(params[:id])
  end

  def update
    device = MeasuringDevice.find(params[:id])
    device.update_attributes(params[:measuring_device])
    device.save!
    redirect_to url_for(:action => :index), :notice => t("operator.measuring_devices.messages.saved")
  end

  def destroy
    device = MeasuringDevice.find(params[:id])
    device.destroy
    redirect_to url_for(:action => :index), :notice => t("operator.measuring_devices.messages.removed")
  end

end
