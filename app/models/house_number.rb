class HouseNumber < ActiveRecord::Base
  belongs_to :period
  belongs_to :subject
  belongs_to :house_type
  has_many :house_kind_numbers, :dependent => :destroy
  has_many :house_kinds, :through => :house_kind_numbers

  attr_accessible :equipped, :required, :total, :house_type_id

  # Relations
  validates :subject_id,    :presence => true, :uniqueness => { :scope => [:period_id, :house_type_id]  }
  validates :period_id,     :presence => true, :uniqueness => { :scope => [:subject_id, :house_type_id] }
  validates :house_type_id, :presence => true, :uniqueness => { :scope => [:subject_id, :period_id]     }
  # House numbers
  validates :total,    :numericality => { :only_integer => true }
  validates :required, :numericality => { :only_integer => true }
  validates :equipped, :numericality => { :only_integer => true }
  # Custom validators
  validate :number_constraints

private

  def number_constraints
    errors.add(:required, :too_big) unless (required <= total)
    errors.add(:equipped, :too_big) unless (equipped <= required)
  end

end
