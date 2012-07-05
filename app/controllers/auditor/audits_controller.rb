# encoding: utf-8
class Auditor::AuditsController < AuditorController

  def districts
    @audits = Audit.includes(:subject).where(:period_id => @period.id, :subjects => {:type => 'District'}).order("subjects.id ASC")
    @subjects = District.all
    @subject_type = District
    render 'report'
  end
  
  def authorities
    @audits = Audit.includes(:subject).where(:period_id => @period.id, :subjects => {:type => 'Authority'}).order("subjects.name ASC")
    @use_only_filled_subjects = true
    @subject_type = Authority
    render 'report'
  end

  def export
    respond_to do |format|
      format.xlsx do
        p = Axlsx::Package.new
        wb = p.workbook
        wb = Auditor::AuditsExporter::export(wb, @period)
        begin
          temp = Tempfile.new("audits.xlsx")
          p.serialize temp.path
          send_file temp.path, :filename => "audit_#{@period.date}.xlsx", :type => "application/xlsx"
        ensure
          temp.close
          temp.unlink
        end
      end
    end
  end

end
