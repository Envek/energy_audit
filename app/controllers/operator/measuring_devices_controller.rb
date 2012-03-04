class Operator::MeasuringDevicesController < OperatorsController
  before_filter :initialize_common_vars

  def index
    @current_devices = MeasuringDevice.where(:period_id => @period.id, :subject_id => @subject.id).all
  end

  def new
  end

  def create
    MeasuringDevice.transaction do
      begin
        @areas.each do |a|
          @kinds.each do |k|
            device = MeasuringDevice.new(
              :period => @period, :subject => @subject, :area => a, :kind => k,
              :start_value => params[:measuring_device][a.id.to_s][k.id.to_s][:start_value],
              :planned_value => params[:measuring_device][a.id.to_s][k.id.to_s][:planned_value],
              :final_value => params[:measuring_device][a.id.to_s][k.id.to_s][:final_value]
            )
            device.save!
          end
        end
      rescue
        render :new
      else
        redirect_to url_for(:action => :index), :notice => "Created"
      end
    end
  end

  def edit
    devices = MeasuringDevice.where(:period_id => @period.id, :subject_id => @subject.id)
    redirect_to :action => :new and return if devices.count.zero?
    @current_devices = devices.all
  end

  def update
    MeasuringDevice.transaction do
      begin
        @areas.each do |a|
          @kinds.each do |k|
            device = MeasuringDevice.where(:period_id => @period.id, :subject_id => @subject.id, :area_id => a.id, :kind_id => k.id).first
            device.start_value = params[:measuring_device][a.id.to_s][k.id.to_s][:start_value]
            device.planned_value = params[:measuring_device][a.id.to_s][k.id.to_s][:planned_value]
            device.final_value = params[:measuring_device][a.id.to_s][k.id.to_s][:final_value]
            device.save!
          end
        end
      rescue
        render :edit
      else
        redirect_to url_for(:action => :index), :notice => "Saved"
      end
    end
  end

private

  def initialize_common_vars
    @val_types = [:start_value, :planned_value, :final_value]
    @period = session[:period]
    @subject = session[:subject]
    @areas = Area.all
    @kinds = Kind.all
  end

end
