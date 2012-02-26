class Admin::Users::AuditorsController < Admin::Users::UsersController
  active_scaffold :auditor do |conf|
  end
end 
