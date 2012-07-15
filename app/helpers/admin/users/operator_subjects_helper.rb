module Admin::Users::OperatorSubjectsHelper

  def operator_subject_subject_form_column(record, options)
    subject_ids = []
    subject_ids = Subject.pluck(:id) - User.find(params[:user_id]).subject_ids if params[:user_id]
    subject_ids += [OperatorSubject.find(params[:id]).subject_id] if params[:id]
    select_tag "record[subject]", grouped_options_for_select(subjects_grouped_for_select(subject_ids))
  end

end
