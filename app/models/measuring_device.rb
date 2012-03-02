class MeasuringDevice < ActiveRecord::Base
  belongs_to :period
  belongs_to :subject
  belongs_to :area
  belongs_to :kind
end
