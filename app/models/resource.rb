class Resource < ActiveRecord::Base
  has_many :consumptions, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true

  scope :with_consumptions, includes(:consumptions)
  scope :for_period_and_subject, lambda { |p, s| with_consumptions.where(:consumptions => { :period_id => p.id, :subject_id => s.id})}
  scope :free_for_period_and_subject_with_resource, lambda { |p, s, r|
    excluded_ids = for_period_and_subject(p,s).select(:id).map{|res| res.id} - [(r.id if r)]
    where('id NOT IN (?)', excluded_ids.any?? excluded_ids : 0 )
  }

end
