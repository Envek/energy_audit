class Auditor::MeasuringDevicesController < AuditorController
  before_filter :load_kinds_and_areas

  def districts
    @areas = Area.includes(:measuring_devices => [:kind, :subject]).where(:measuring_devices => {:period_id => @period.id}, :subjects => {:type => 'District'}).order("areas.id ASC, subjects.id ASC, kinds.id ASC")
    @subjects = District.all
    @subject_type = District
    render 'report'
  end
  
  def authorities
    @areas = Area.includes(:measuring_devices => [:kind, :subject]).where(:measuring_devices => {:period_id => @period.id}, :subjects => {:type => 'Authority'}).order("areas.id ASC, subjects.name ASC, kinds.id ASC")
    @use_only_filled_subjects = true
    @subject_type = Authority
    render 'report'
  end

  def organisations
    @areas = Area.includes(:measuring_devices => [:kind, :subject]).where(:measuring_devices => {:period_id => @period.id}, :subjects => {:type => 'Organisation'}).order("areas.id ASC, subjects.name ASC, kinds.id ASC")
    @use_only_filled_subjects = true
    @subject_type = Organisation
    render 'report'
  end

  def total
    ActiveRecord::IdentityMap.use do
      @subject_types = [District, Authority, Organisation]
      stub = MeasuringDevice.unscoped.joins([:kind, :subject, :area]).where(:period_id => @period.id).group("areas.id, kinds.id, subjects.type")
      @devices = stub.order("areas.id ASC, subjects.type ASC, kinds.id ASC").
                 select("areas.id AS area_id, subjects.type AS subject_type, kinds.id AS kind_id, SUM(measuring_devices.start_value) AS start_value,
                         SUM(measuring_devices.planned_value) AS planned_value, SUM(measuring_devices.final_value) final_value")
      @areas = Area.find(stub.pluck(:area_id).uniq)
      @kinds = Kind.find(stub.pluck(:kind_id).uniq)
    end
  end

  def export
    respond_to do |format|
      format.xlsx do
        p = Axlsx::Package.new
        wb = p.workbook
        wb = Auditor::MeasuringDevicesExporter::export(wb, @period)
        begin
          temp = Tempfile.new("measuring_devices_#{request.uuid}.xlsx")
          p.serialize temp.path
          send_file temp.path, :filename => "measuring_devices_#{@period.date}.xlsx", :type => "application/xlsx"
        ensure
          temp.close
          temp.unlink
        end
      end
    end
  end

  private

  def load_kinds_and_areas
    @kinds = Kind.all
    @areas = Area.all
    @val_types = [:start_value, :planned_value, :final_value]
  end

end
