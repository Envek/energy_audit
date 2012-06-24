class Auditor::ActivityValuesController < AuditorController
  
  def districts
    subjects(District)
  end
  
  def authorities
    subjects(Authority)
  end

  def organisations
    subjects(Organisation)
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

  def district_totals
    totals(District)
  end

  def authority_totals
    totals(Authority)
  end

  def organisation_totals
    totals(Organisation)
  end

protected

  def subjects(subject_type)
    @subject_type = subject_type
    @subjects = @subject_type.includes(:activity_values => :activity)
                             .joins(:activity_values => :activity)
                             .where(:activity_values => {:period_id => @period.id})
    render 'subjects'
  end

  def totals(subject_type)
    @subject_type = subject_type
    @values = ActivityValue.joins(:subject).where(:period_id => @period.id, :subjects => {:type => @subject_type.to_s}).group("subject_id")
              .select((ActivityValue.significant_column_names+[:subject_id]).collect { |col| "sum(#{col}) as #{col}" }.join(', '))
    @subjects = @subject_type.find(@values.map {|v| v.subject_id}) # Preload subjects (as of Rails 3.2.5 includes method breaks previous query)
    render 'totals'
  end

end
