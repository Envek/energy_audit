class Operator::OptionsController < OperatorsController

  def update
    @period = Period.from_param(params[:period_id])
    @subject = Subject.find(params[:subject_id])
    type = params[:type].match(/\A[a-zA-z]+\Z/).nil?? "measuring_devices" : params[:type]
    redirect_to url_for(:controller => "operator/#{type}", :action => :index, :period_id => @period.to_param, :subject_id => @subject.id), notice: "Settings saved!"
  end

end
