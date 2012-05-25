class Admin::Dictionaries::ResourcesController < Admin::Dictionaries::DictionariesController
  active_scaffold :resource do |conf|
    conf.columns = [:name, :unit]
    conf.columns.each { |c| c.inplace_edit = true }
    conf.show.link = false
  end
end 
