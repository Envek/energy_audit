class OperatorSubject < ActiveRecord::Base
  belongs_to :user, :foreign_key => "operator_id"
  belongs_to :subject
  
  validates :operator_id, :presence => true, :uniqueness => {:scope => :subject_id}
  validates :subject_id, :presence => true, :uniqueness => {:scope => :operator_id}

  def to_s
    I18n.t('activerecord.attributes.operator_subject.label', :subject => subject.name)
  end

end
