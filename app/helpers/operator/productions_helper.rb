module Operator::ProductionsHelper
  def production_resources_for_select_with_resource(resource)
    ProductionResource.free_for_period_and_subject_with_resource(@period, @subject, resource).map do |resource|
        [resource.name, resource.id]
    end
  end
end
