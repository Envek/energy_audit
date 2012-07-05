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
    respond_to do |format|
      format.xlsx do
        p = Axlsx::Package.new
        wb = p.workbook
        wb = Auditor::ConsumptionsExporter::export(wb, @period)
        begin
          temp = Tempfile.new("consumptions.xlsx")
          p.serialize temp.path
          send_file temp.path, :filename => "consumptions_#{@period.date}.xlsx", :type => "application/xlsx"
        ensure
          temp.close
          temp.unlink
        end
      end
    end
  end

  private

  def load_resources
    @resources = Resource.all
  end

end
