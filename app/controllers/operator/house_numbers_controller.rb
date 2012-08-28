class Operator::HouseNumbersController < OperatorsController

  def index
    @house_numbers = HouseNumber.includes(:house_kind_numbers => :house_kind, :house_type => nil).where(:period_id => @period.id, :subject_id => @subject.id)
  end

  def new
    authorize! :create, HouseNumber
    @house_number = HouseNumber.new({:period => @period, :subject => @subject}, :without_protection => true)
  end

  def create
    unless HouseNumber.where(:period_id => @period.id, :subject_id => @subject.id, :house_type_id => params[:house_number][:house_type_id]).any?
      @house_number = HouseNumber.new({:period => @period, :subject => @subject}, :without_protection => true)
      @house_number.update_attributes(params[:house_number])
      authorize! :create, @house_number
      if @house_number.save
        redirect_to url_for(:action => :index), :notice => t("operator.house_numbers.messages.saved")
      else
        render :new
      end
    else
      redirect_to url_for(:action => :index), :error => t("operator.house_numbers.messages.already_exists")
    end
  end

  def edit
    @house_number = HouseNumber.find(params[:id])
    authorize! :update, @house_number
  end

  def update
    @house_number = HouseNumber.find(params[:id])
    authorize! :update, @house_number
    @house_number.update_attributes(params[:house_number])
    if @house_number.save
      redirect_to url_for(:action => :index), :notice => t("operator.house_numbers.messages.saved")
    else
      render :edit
    end
  end

  def destroy
    value = HouseNumber.find(params[:id])
    authorize! :delete, value
    value.destroy
    redirect_to url_for(:action => :index), :notice => t("operator.house_numbers.messages.removed")
  end

end
