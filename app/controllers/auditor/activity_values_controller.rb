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

  def budgets
    types = [Authority, District, Organisation]
    @values = {}
    types.each do |t|
      value = ActivityValue.joins(:subject).where(:period_id => 4, :subjects => {:type => t.to_s}).group("subjects.type")
              .select(ActivityValue.significant_column_names.collect { |col| " sum(#{col}) as #{col}" }.join(','))
              # Well, it was a bit tricky. It just executes sql SUMs for all required columns
      @values[t.to_s] = value.first if value.any?
    end
    render 'budget'
  end

end
