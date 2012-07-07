class Period < ActiveRecord::Base
  has_many :measuring_devices
  has_many :audits
  has_many :activity_values

  validates :date, :presence => true, :uniqueness => true

  default_scope :order => "periods.date DESC"

  def to_label
    I18n::localize self.date, :format => "%B %Y"
  end

  def start_date
    @start_date ||= self.date - (self.date.month-1).month
  end

  def start_date_localized
    I18n::localize self.start_date, :format => :default
  end
  
  def date_localized
    I18n::localize self.date, :format => :default
  end

  # Redefine to/from param methods for nice routing

  def self.from_param(param)
    /(?<year>\d{4})-(?<month>\d{2})/ =~ param
    Period.find_by_date!(Date.civil(year.to_i,month.to_i))
  end

  def to_param
    date.strftime('%Y-%m')
  end

end
