class Admin::Dictionaries::HouseTypesController < Admin::Dictionaries::DictionariesController
  active_scaffold :house_type do |conf|
    conf.columns = [:name]
    conf.columns.each { |c| c.inplace_edit = true }
    conf.show.link = false
  end
end 
