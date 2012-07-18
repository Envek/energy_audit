class Auditor::ProductionsController < AuditorController
  before_filter :load_production_resources

  def districts
    @productions = Production.includes(:subject).where(:period_id => @period.id, :subjects => {:type => 'District'}).order("subjects.id ASC")
    @subjects = District.all
    @subject_type = District
    render 'report'
  end

  private

  def load_production_resources
    @production_resources = ProductionResource.all
  end

end
