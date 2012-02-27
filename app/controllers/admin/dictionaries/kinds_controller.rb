class Admin::Dictionaries::KindsController < Admin::Dictionaries::DictionariesController
  active_scaffold :kind do |conf|
    conf.columns = [:name]
    conf.show.link = false
  end
end 
