module ApplicationHelper

  def subjects_grouped_for_select(subject_ids=nil)
    [District, Authority, Organisation].map { |subject_type|
      entries = subject_ids.is_a?(Array) ? subject_type.where(:id => subject_ids) : subject_type.all
      [subject_type.model_name.human(:count => 2), entries.map{|s| [s.name, s.id]}] if entries.any?
    }.compact
  end

  def current_subject
    if @subject and user_signed_in? and current_user.subjects.include?(@subject)
      @subject
    else
      current_user.subjects.first
    end
  end

end
