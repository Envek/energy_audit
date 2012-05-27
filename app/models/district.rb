class District < Subject

  default_scope :order => "subjects.id ASC"

  def authorized_for?(*args)
    if ["destroy", "edit"].include?(args[0][:action])
      return (id <= 29 ? false : true);
    else
      return true
    end
  end

end
