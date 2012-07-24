class Operator::ActivityValuesController < OperatorsController

  def index
    @categories = ActivityCategory.for_period_and_subject(@period, @subject)
  end

  def new
    authorize! :create, ActivityValue
    @value = ActivityValue.new
  end

  def create
    @value = ActivityValue.new(params[:activity_value])
    @value.period = @period
    @value.subject = @subject
    authorize! :create, @value
    respond_to do |format|
      if @value.save
        format.html { redirect_to( url_for(:action => :index), :notice => t("operator.activity_values.messages.created") ) }
      else
        format.html { render :action => 'new' }
      end
    end
  end

  def edit
    @value = ActivityValue.find(params[:id])
    authorize! :update, @value
  end

  def update
    @value = ActivityValue.find(params[:id])
    @value.update_attributes(params[:activity_value])
    authorize! :update, @value
    respond_to do |format|
      if @value.save
        format.html { redirect_to( url_for(:action => :index), :notice => t("operator.activity_values.messages.saved") ) }
      else
        format.html { render :action => 'edit' }
      end
    end
  end

  def destroy
    value = ActivityValue.find(params[:id])
    authorize! :delete, value
    if value.destroy
      redirect_to url_for(:action => :index), :notice => t("operator.activity_values.messages.removed")
    else
      redirect_to url_for(:action => :index), :alarm => t("operator.activity_values.messages.cant_remove")
    end
  end

end
