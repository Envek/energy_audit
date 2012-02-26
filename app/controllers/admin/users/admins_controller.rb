class Admin::Users::AdminsController < Admin::Users::UsersController
  active_scaffold :admin do |conf|
  end
end 
