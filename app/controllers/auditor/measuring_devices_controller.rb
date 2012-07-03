class Auditor::MeasuringDevicesController < AuditorController
  before_filter :load_kinds_and_areas

  def districts
    @areas = Area.includes(:measuring_devices => [:kind, :subject]).where(:measuring_devices => {:period_id => @period.id, :subject_id => {:type => 'District'}}).order("areas.id ASC, subjects.id ASC, kinds.id ASC")
    @subjects = District.all
    @subject_type = District
    render 'report'
  end
  
  def authorities
    @areas = Area.includes(:measuring_devices => [:kind, :subject]).where(:measuring_devices => {:period_id => @period.id, :subject_id => {:type => 'Authority'}}).order("areas.id ASC, subjects.name ASC, kinds.id ASC")
    @use_only_filled_subjects = true
    @subject_type = Authority
    render 'report'
  end

  def organisations
    @areas = Area.includes(:measuring_devices => [:kind, :subject]).where(:measuring_devices => {:period_id => @period.id, :subject_id => {:type => 'Organisation'}}).order("areas.id ASC, subjects.name ASC, kinds.id ASC")
    @use_only_filled_subjects = true
    @subject_type = Organisation
    render 'report'
  end

  def total
    
  end

  private

  def load_kinds_and_areas
    @kinds = Kind.all
    @areas = Area.all
    @val_types = [:start_value, :planned_value, :final_value]
  end

end
