class Admin::Dictionaries::ActivitiesController < Admin::Dictionaries::DictionariesController
  active_scaffold :activity do |conf|
    conf.columns = [:name, :activity_category]
    conf.columns[:activity_category].clear_link
    conf.columns[:activity_category].form_ui = :select
    conf.show.link = false
  end
end 
