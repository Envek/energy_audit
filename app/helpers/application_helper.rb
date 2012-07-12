module ApplicationHelper

  def current_user
    current_admin or current_auditor or current_operator
  end

  def user_signed_in?
    admin_signed_in? or auditor_signed_in? or operator_signed_in?
  end

  def destroy_user_session_path
    destroy_admin_session_path or destroy_auditor_session_path or destroy_operator_session_path
  end

  def subjects_grouped_for_select(subject_ids=nil)
    [District, Authority, Organisation].map { |subject_type|
      entries = subject_ids.is_a?(Array) ? subject_type.where(:id => subject_ids) : subject_type.all
      [subject_type.model_name.human(:count => 2), entries.map{|s| [s.name, s.id]}] if entries.any?
    }.compact
  end

end
