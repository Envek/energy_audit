module Operator::HouseTypesHelper
  def house_types_for_select_with_type(type)
    HouseType.free_for_period_and_subject_with_type(@period, @subject, type).map do |type|
        [type.name, type.id]
    end
  end
end
