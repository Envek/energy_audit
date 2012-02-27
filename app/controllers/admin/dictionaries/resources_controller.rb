class Admin::Dictionaries::ResourcesController < Admin::Dictionaries::DictionariesController
  active_scaffold :resource do |conf|
    conf.columns = [:name]
    conf.show.link = false
  end
end 
