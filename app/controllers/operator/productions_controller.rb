class Operator::ProductionsController < OperatorsController

  def index
    @productions = Production.with_resource.where(:period_id => @period.id, :subject_id => @subject.id)
  end

  def new
    authorize! :create, Production
    @production = Production.new({:period => @period, :subject => @subject}, :without_protection => true)
  end

  def create
    unless Production.where(:period_id => @period.id, :subject_id => @subject.id, :production_resource_id => params[:production][:production_resource_id]).any?
      @production = Production.new({:period => @period, :subject => @subject}, :without_protection => true)
      @production.update_attributes(params[:production])
      authorize! :create, @production
      if @production.save
        redirect_to url_for(:action => :index), :notice => t("operator.productions.messages.saved")
      else
        render :new
      end
    else
      redirect_to url_for(:action => :index), :error => t("operator.productions.messages.already_exists")
    end
  end

  def edit
    @production = Production.find(params[:id])
    authorize! :update, @production
  end

  def update
    @production = Production.find(params[:id])
    authorize! :update, @production
    @production.update_attributes(params[:production])
    if @production.save
      redirect_to url_for(:action => :index), :notice => t("operator.productions.messages.saved")
    else
      render :edit
    end
  end

  def destroy
    value = Production.find(params[:id])
    authorize! :delete, value
    value.destroy
    redirect_to url_for(:action => :index), :notice => t("operator.productions.messages.removed")
  end

end
