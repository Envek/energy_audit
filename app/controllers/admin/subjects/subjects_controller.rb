class Admin::Subjects::SubjectsController < ApplicationController
  before_filter :authenticate_admin!

  active_scaffold :subject do |conf|
    conf.columns = [:name]
  end
end 
