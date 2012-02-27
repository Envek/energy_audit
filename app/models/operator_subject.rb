class OperatorSubject < ActiveRecord::Base
  belongs_to :operator
  belongs_to :subject
  
  validates :operator_id, :presence => true, :uniqueness => {:scope => :subject_id}
  validates :subject_id, :presence => true, :uniqueness => {:scope => :operator_id}
end
