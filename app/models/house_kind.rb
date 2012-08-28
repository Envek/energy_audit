class HouseKind < ActiveRecord::Base
  has_many :house_kind_numbers, :dependent => :destroy
  has_many :house_numbers, :through => :house_kind_numbers

  attr_accessible :name

  validates :name, :presence => true, :uniqueness => true

  default_scope order(:id)

  scope :for_house_number, lambda { |hn| includes(:house_numbers).where(:house_numbers => {:id => hn.id}) }
  scope :free_for_house_number_with_kind, lambda { |hn, kind|
    excluded_ids = for_house_number(hn).select(:id).map{|k| k.id} - [(kind.id if kind)]
    where('id NOT IN (?)', excluded_ids.any?? excluded_ids : 0 )
  }

end
