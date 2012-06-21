class Authority < Subject

  default_scope :order => "subjects.name ASC"

end
