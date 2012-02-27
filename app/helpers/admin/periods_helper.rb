module Admin::PeriodsHelper
  def date_form_column(record, options)
    date_select :record, :date, {:discard_day => true}
  end

  def date_column(record)
    record.to_label
  end
end
