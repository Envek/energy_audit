module Auditor::PeriodsHelper
  def list_row_class(record)
    if record.id == @period.id
      'current_period'
    end
  end
end
