class Operator::MeasuringDevicesController < OperatorsController

  def index
    @areas = Area.includes(:measuring_devices => :kind).for_period_and_subject(@period, @subject)
  end

  def new
    @device = MeasuringDevice.new(:period_id => @period.id, :subject_id => @subject.id)
    authorize! :create, @device
  end

  def create
    unless MeasuringDevice.where(:period_id => @period.id, :subject_id => @subject.id,
                                 :area_id => params[:measuring_device][:area_id],
                                 :kind_id => params[:measuring_device][:kind_id],).any?
      @device = MeasuringDevice.new(:period => @period, :subject => @subject)
      authorize! :create, @device
      @device.update_attributes(params[:measuring_device])
      if @device.save
        redirect_to url_for(:action => :index), :notice => t("operator.measuring_devices.messages.saved")
      else
        render :new
      end
    else
      redirect_to url_for(:action => :index), :alert => t("operator.measuring_devices.messages.already_exists")
    end
  end

  def edit
    @device = MeasuringDevice.find(params[:id])
    authorize! :update, @device
  end

  def update
    @device = MeasuringDevice.find(params[:id])
    authorize! :update, @device
    @device.update_attributes(params[:measuring_device])
    if @device.save
      redirect_to url_for(:action => :index), :notice => t("operator.measuring_devices.messages.saved")
    else
      render :edit
    end
  end

  def destroy
    @device = MeasuringDevice.find(params[:id])
    authorize! :delete, @device
    @device.destroy
    redirect_to url_for(:action => :index), :notice => t("operator.measuring_devices.messages.removed")
  end

end
