class Operator::DashboardController < OperatorsController

  def index
    @subjects = current_operator.subjects
    @measuring_devices = {}
    @audit = {}
    @activities = {}
    @total_activities = Activity.count
    @consumptions = {}
    @total_consumptions = Consumption.count
    @subjects.each do |subject|
      @measuring_devices[subject.id] = {
        :filled => MeasuringDevice.where(:period_id => @period.id, :subject_id => subject.id).count,
        :total => Area.count * Kind.count
      }
      @audit[subject.id] = Audit.where(:period_id => @period.id, :subject_id => subject.id).any?
      @activities[subject.id] = ActivityValue.where(:period_id => @period.id, :subject_id => subject.id).uniq.pluck(:activity_id).count
      @consumptions[subject.id] = Consumption.where(:period_id => @period.id, :subject_id => subject.id).count
    end
  end

end
