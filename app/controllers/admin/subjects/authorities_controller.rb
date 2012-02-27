class Admin::Subjects::AuthoritiesController < Admin::Subjects::SubjectsController
  active_scaffold :authority do |conf|
  end
end 
