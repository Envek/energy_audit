module Auditor::PeriodsHelper
  def list_row_class(record)
    if @period and record.is_a? Period and record.id == @period.id
      'current_period'
    else
      ''
    end
  end
end
