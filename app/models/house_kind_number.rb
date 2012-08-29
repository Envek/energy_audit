class HouseKindNumber < ActiveRecord::Base
  belongs_to :house_number
  belongs_to :house_kind

  attr_accessible :equipped, :required, :house_kind_id

  # Relations
  validates :house_number_id, :presence => true, :uniqueness => { :scope => :house_kind_id   }
  validates :house_kind_id,   :presence => true, :uniqueness => { :scope => :house_number_id }
  # House numbers
  validates :required, :presence => true, :numericality => { :only_integer => true }
  validates :equipped, :presence => true, :numericality => { :only_integer => true }
  # Custom validators
  validate :number_constraints

private

  def number_constraints
    errors.add(:equipped, :too_big) unless equipped and required and (equipped <= required)
  end

end
