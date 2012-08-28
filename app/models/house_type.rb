class HouseType < ActiveRecord::Base
  has_many :house_numbers, :dependent => :destroy

  attr_accessible :name

  validates :name, :presence => true, :uniqueness => true

  default_scope order(:id)

  scope :for_period_and_subject, lambda { |p, s|
    includes(:house_numbers).where(:house_numbers => {:period_id => p.id, :subject_id => s.id})
  }
  scope :free_for_period_and_subject_with_type, lambda { |p, s, type|
    excluded_ids = for_period_and_subject(p,s).select(:id).map{|t| t.id} - [(type.id if type)]
    where('id NOT IN (?)', excluded_ids.any?? excluded_ids : 0 )
  }

end
