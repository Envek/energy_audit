class Subject < ActiveRecord::Base
  has_many :operator_subjects, :dependent => :destroy
  has_many :users, :through => :operator_subjects
  has_many :measuring_devices, :dependent => :destroy
  has_many :audits,            :dependent => :destroy
  has_many :activity_values,   :dependent => :destroy
  has_many :consumptions,      :dependent => :destroy
  has_many :productions,       :dependent => :destroy
  has_many :house_numbers,     :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true

  def to_label
    name
  end

end
