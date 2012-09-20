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

  def export
    c_1 = Consumption.includes(:subject).where(:period_id => @period.id, :subjects => {:type => 'District'}).order("subjects.id ASC")
    s_1 = District.all
    c_2 = Consumption.includes(:subject).where(:period_id => @period.id, :subjects => {:type => 'Authority'}).order("subjects.name ASC")
    s_2 = c_2.map{|d| d.subject }.uniq
    @data = [{:consumptions => c_1, :subjects => s_1, :type => District}, {:consumptions => c_2, :subjects => s_2, :type=> Authority}]
    respond_to do |format|
      format.xlsx {
        render :xlsx => 'export', :disposition => "attachment", :filename => t("auditor.consumptions.export.filename", :date => @period.date)
      }
    end
  end

  private

  def load_resources
    @resources = Resource.all
  end

end
