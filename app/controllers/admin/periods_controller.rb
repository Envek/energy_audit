class Admin::PeriodsController < ApplicationController
  before_filter :authenticate_user!
  active_scaffold :period do |conf|
    conf.columns = [:date, :published]
    conf.show.link = false
  end
end 
