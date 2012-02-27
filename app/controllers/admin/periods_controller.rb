class Admin::PeriodsController < ApplicationController
  active_scaffold :period do |conf|
    conf.columns = [:date, :published]
    conf.show.link = false
  end
end 
