class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :registerable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :full_name, :email, :password, :password_confirmation, :remember_me

  # Relations
  has_many :operator_subjects, :foreign_key => "operator_id"
  has_many :subjects, :through => :operator_subjects
  
  # Validations
  validates :full_name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  def surname
    self.full_name.split[0]
  end
  
  def surname_initials
    s = self.full_name.split
    "#{s[0]} #{s[1..-1].map { |w| "#{w[0]}." }.join(' ')}"
  end

  def to_s
    surname_initials
  end

end
