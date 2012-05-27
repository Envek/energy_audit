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

end
