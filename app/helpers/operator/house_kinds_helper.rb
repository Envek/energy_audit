module Operator::HouseKindsHelper
  def house_kinds_for_select_with_kind(house_number, kind)
    HouseKind.free_for_house_number_with_kind(house_number, kind).map do |kind|
        [kind.name, kind.id]
    end
  end
end
