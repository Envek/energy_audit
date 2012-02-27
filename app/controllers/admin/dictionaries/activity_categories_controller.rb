class Admin::Dictionaries::ActivityCategoriesController < Admin::Dictionaries::DictionariesController
  active_scaffold :activity_category do |conf|
    conf.columns = [:name]
    conf.nested.add_link :activities
    conf.show.link = false
  end
end 
