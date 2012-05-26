class OperatorSubject < ActiveRecord::Base
  belongs_to :operator
  belongs_to :subject
  
  validates :operator_id, :presence => true, :uniqueness => {:scope => :subject_id}
  validates :subject_id, :presence => true, :uniqueness => {:scope => :operator_id}

  def to_s
    self.human_attribute_name :label, :subject => subject.name
  end

end
