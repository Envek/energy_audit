class Admin::Users::OperatorsController < Admin::Users::UsersController
  active_scaffold :operator do |conf|
  end
end 
