module Admin::Users::OperatorSubjectsHelper

  def operator_subject_subject_form_column(record, options)
    subject_ids = Subject.pluck(:id) - Operator.find(params[:operator_id]).subject_ids if params[:operator_id]
    subject_ids += [OperatorSubject.find(params[:id]).subject_id] if params[:id]
    select_tag "record[subject]", grouped_options_for_select(subjects_grouped_for_select(subject_ids))
  end

end
