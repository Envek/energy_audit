class Admin::Dictionaries::AreasController < Admin::Dictionaries::DictionariesController
  active_scaffold :area do |conf|
    conf.columns = [:name]
    conf.show.link = false
  end
end 
