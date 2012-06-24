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
      value = ActivityValue.joins(:subject).where(:period_id => @period.id, :subjects => {:type => t.to_s}).group("subjects.type")
              .select(ActivityValue.significant_column_names.collect { |col| " sum(#{col}) as #{col}" }.join(','))
              # Well, it was a bit tricky. It just executes sql SUMs for all required columns
      @values[t.to_s] = value.first if value.any?
    end
    render 'budget'
  end

  def activities
    ActiveRecord::IdentityMap.use do
      types = [District, Authority, Organisation]
      @values = {}
      types.each do |t|
        values = ActivityValue.joins(:subject, :activity)
                .where(:period_id => @period.id, :subjects => {:type => t.to_s}).group("activity_id")
                .select((ActivityValue.significant_column_names+[:activity_id]).collect { |col| "sum(#{col}) as #{col}" }.join(', '))
        Activity.find(values.map {|v| v.activity_id}) # Preload activities (as of Rails 3.2.5 includes method breaks previous query)
        @values[t.to_s] = values if values.any?
      end
      render 'activities'
    end
  end

  def districts_total
  
  end

  def authorities_total
  
  end

  def organisations_total
  
  end

end
