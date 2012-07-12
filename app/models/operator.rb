class Operator < User
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  has_many :operator_subjects, :dependent => :destroy
  has_many :subjects, :through => :operator_subjects
end
