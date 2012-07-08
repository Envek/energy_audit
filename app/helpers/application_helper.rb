module ApplicationHelper

  def subjects_grouped_for_select(subjects=[])
    [District, Authority, Organisation].map { |subject_type|
      entries = subjects.any?? subject_type.where(:id => subjects.map{|s| s.id}) : subject_type.all
      [subject_type.model_name.human(:count => 2), entries.map{|s| [s.name, s.id]}] if entries.any?
    }.compact
  end

end
