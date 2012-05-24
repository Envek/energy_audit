module Operator::ActivityValuesHelper
  def activities_grouped_for_select_with_activity(activity)
    ActivityCategory.free_for_period_and_subject_with_activity(@period, @subject, activity).map do |category|
      activities = category.activities.map do |activity|
        [activity.name, activity.id]
      end
      [category.name, activities]
    end
  end

end
