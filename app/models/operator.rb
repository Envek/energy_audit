class Operator < User
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
