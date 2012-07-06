class ActivityCategory < ActiveRecord::Base
  has_many :activities

  validates :name, :presence => true, :uniqueness => true

  scope :with_values, includes(:activities => :activity_values)
  scope :for_period_and_subject, lambda { |p, s| with_values.where(:activity_values => {:period_id => p.id, :subject_id => s.id})}
  scope :free_for_period_and_subject_with_activity, lambda { |p, s, ac|
    except_activities = Activity.includes(:activity_values).where(:activity_values => {:period_id => p.id, :subject_id => s.id}).select(:id).map{|a| a.id} - [(ac.id if ac)]
    includes(:activities).where('activities.id NOT IN (?)', except_activities.any?? except_activities : 0 )
  }
  

end
