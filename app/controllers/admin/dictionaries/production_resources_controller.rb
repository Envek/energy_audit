class Admin::Dictionaries::ProductionResourcesController < Admin::Dictionaries::DictionariesController
  active_scaffold :production_resource do |conf|
    conf.columns = [:name, :unit]
    conf.columns.each { |c| c.inplace_edit = true }
    conf.show.link = false
  end
end 
