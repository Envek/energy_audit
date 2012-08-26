class Auditor::HouseNumbersController < AuditorController

  def districts
    subjects(District)
  end
  
  def authorities
    subjects(Authority)
  end

  def organisations
    subjects(Organisation)
  end

protected

  def subjects(subject_type)
    @subject_type = subject_type
    @kinds = HouseKind.all
    @subjects = @subject_type.includes(:house_numbers => {:house_type => nil, :house_kind_numbers => :house_kind})
                             .joins(:house_numbers)
                             .where(:house_numbers => {:period_id => @period.id})
    @types = @subjects.map{|s| s.house_numbers.map{|n| n.house_type } }.flatten.uniq
    render 'subjects'
  end

end
