class Auditor::ActivityValuesController < AuditorController
  
  def districts
    @subjects = District.includes(:activity_values => :activity).
                         joins(:activity_values => :activity).
                         where(:activity_values => {:period_id => @period.id})
    @subject_type = District
    render 'subjects'
  end
  
  def authorities
    @subjects = Authority.includes(:activity_values => :activity).
                          joins(:activity_values => :activity).
                          where(:activity_values => {:period_id => @period.id})
    @subject_type = Authority
    render 'subjects'
  end

  def organisations
    @subjects = Organisation.includes(:activity_values => :activity).
                          joins(:activity_values => :activity).
                          where(:activity_values => {:period_id => @period.id})
    @subject_type = Organisation
    render 'subjects'
  end

end
