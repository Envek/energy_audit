class Operator::OptionsController < OperatorsController

  def update
    @period = Period.find(params[:period_id])
    session[:period] = @period
    @subject = Subject.find(params[:subject_id])
    session[:subject] = @subject
    redirect_to request.referer, notice: "Settings saved!"
  end

end
