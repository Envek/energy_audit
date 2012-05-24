class Operator::ActivityValuesController < OperatorsController
  before_filter :initialize_common_vars

  def index
    @categories = ActivityCategory.for_period_and_subject(@period, @subject)
  end

  def new
    @value = ActivityValue.new
  end

  def create
    unless ActivityValue.where(:period_id => @period.id, :subject_id => @subject.id, :activity_id => params[:activity_value][:activity_id]).any?
      value = ActivityValue.new(:period => @period, :subject => @subject)
      value.update_attributes(params[:activity_value])
      value.save
      redirect_to url_for(:action => :index), :notice => "Saved"
    else
      redirect_to url_for(:action => :index), :error => "Already exists"
    end
  end

  def edit
    @value = ActivityValue.find(params[:id])
  end

  def update
    value = ActivityValue.find(params[:id])
    value.update_attributes(params[:activity_value])
    value.save!
    redirect_to url_for(:action => :index), :notice => "Saved"
  end

  def destroy
    value = ActivityValue.find(params[:id])
    value.destroy
    redirect_to url_for(:action => :index), :notice => "Removed"
  end

private

  def initialize_common_vars
    @period = session[:period]
    @subject = session[:subject]
  end

end
