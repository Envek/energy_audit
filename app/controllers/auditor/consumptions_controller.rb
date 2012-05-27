class Auditor::ConsumptionsController < AuditorController
  before_filter :load_resources

  def districts
    @consumptions = Consumption.includes(:subject).where(:period_id => @period.id, :subjects => {:type => 'District'}).order("subjects.id ASC")
    @subjects = District.all
    @subject_type = District
    render 'report'
  end

  def authorities
    @consumptions = Consumption.includes(:subject).where(:period_id => @period.id, :subjects => {:type => 'Authority'}).order("subjects.name ASC")
    @subjects = @consumptions.map{|d| d.subject }.uniq
    @subject_type = Authority
    render 'report'
  end

  def total
    @districts = Consumption.includes(:subject).where(:period_id => @period.id, :subjects => {:type => 'District'})
    @authorities = Consumption.includes(:subject).where(:period_id => @period.id, :subjects => {:type => 'Authority'})
    @total = Consumption.includes(:subject).where(:period_id => @period.id, :subjects => {:type => ['District','Authority']})
  end

  private

  def load_resources
    @resources = Resource.all
  end

end
