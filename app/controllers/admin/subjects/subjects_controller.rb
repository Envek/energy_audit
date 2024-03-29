class Admin::Subjects::SubjectsController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :subject do |conf|
    conf.columns = [:name]
    conf.show.link = false
  end
end 
