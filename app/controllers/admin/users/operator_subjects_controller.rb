class Admin::Users::OperatorSubjectsController < ApplicationController
  active_scaffold :operator_subject do |conf|
    conf.columns = [:subject]
    conf.columns[:subject].clear_link
    conf.columns[:subject].form_ui = :select
    conf.show.link = false
  end
end 
