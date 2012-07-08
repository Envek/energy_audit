class Admin::OperatorSubjectsController < ApplicationController
  before_filter :authenticate_user!
  active_scaffold :operator_subject do |conf|
    conf.columns = [:subject]
    conf.columns[:subject].clear_link
    conf.columns[:subject].form_ui = :select
    conf.show.link = false
  end
end 
