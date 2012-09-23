class Auditor::ProductionsController < AuditorController
  before_filter :load_production_resources

  def districts
    @productions = Production.includes(:subject).where(:period_id => @period.id, :subjects => {:type => 'District'}).order("subjects.id ASC")
    @subjects = District.all
    @subject_type = District
    @total_resources = @productions.map(&:production_resource).uniq
    render 'report'
  end

  def export
    productions = Production.includes(:subject).where(:period_id => @period.id, :subjects => {:type => 'District'}).order("subjects.id ASC")
    @data = [{:productions => productions, :subjects => District.all, :type => District}]
    respond_to do |format|
      format.xlsx {
        render :xlsx => 'export', :disposition => "attachment", :filename => t("auditor.productions.export.filename", :date => @period.date)
      }
    end
  end

  private

  def load_production_resources
    @production_resources = ProductionResource.all
  end

end
