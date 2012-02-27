class Period < ActiveRecord::Base

  validates :date, :presence => true, :uniqueness => true

  default_scope :order => "periods.date DESC"

  def to_label
    I18n::localize self.date, :format => "%B %Y"
  end

end
