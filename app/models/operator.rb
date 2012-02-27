class Operator < User
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  has_many :operator_subjects
  has_many :subjects, :through => :operator_subjects
end
