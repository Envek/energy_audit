class ProductionResource < ActiveRecord::Base
  attr_accessible :name, :unit

  has_many :productions, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true
  validates :unit, :presence => true

  scope :with_productions, includes(:productions)
  scope :for_period_and_subject, lambda { |p, s| with_productions.where(:productions => { :period_id => p.id, :subject_id => s.id})}
  scope :free_for_period_and_subject_with_resource, lambda { |p, s, pr|
    excluded_ids = for_period_and_subject(p,s).select(:id).map{|res| res.id} - [(pr.id if pr)]
    where('id NOT IN (?)', excluded_ids.any?? excluded_ids : 0 )
  }

end
