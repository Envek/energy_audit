class Operator::HouseKindNumbersController < OperatorsController
  before_filter :load_and_authorize_house_number

  def new
    authorize! :create, HouseKindNumber
    @house_kind_number = HouseKindNumber.new({:house_number => @house_number}, :without_protection => true)
  end

  def create
    unless HouseKindNumber.where(:house_number_id => params[:house_number_id], :house_kind_id => params[:house_kind_number][:house_kind_id]).any?
      @house_kind_number = HouseKindNumber.new({:house_number => @house_number}, :without_protection => true)
      @house_kind_number.update_attributes(params[:house_kind_number])
      authorize! :create, @house_kind_number
      if @house_kind_number.save
        redirect_to house_numbers_path(@period, @subject), :notice => t("operator.house_kind_numbers.messages.saved")
      else
        render :new
      end
    else
      redirect_to house_numbers_path(@period, @subject), :error => t("operator.house_kind_numbers.messages.already_exists")
    end
  end

  def edit
    @house_kind_number = HouseKindNumber.find(params[:id])
    authorize! :update, @house_kind_number
  end

  def update
    @house_kind_number = HouseKindNumber.find(params[:id])
    authorize! :update, @house_kind_number
    @house_kind_number.update_attributes(params[:house_kind_number])
    if @house_kind_number.save
      redirect_to house_numbers_path(@period, @subject), :notice => t("operator.house_kind_numbers.messages.saved")
    else
      render :edit
    end
  end

  def destroy
    value = HouseKindNumber.find(params[:id])
    authorize! :delete, value
    value.destroy
    redirect_to house_numbers_path(@period, @subject), :notice => t("operator.house_kind_numbers.messages.removed")
  end

private

  def load_and_authorize_house_number
    @house_number = HouseNumber.find(params[:house_number_id])
    authorize! :manage, @house_number
    @period = @house_number.period
    @subject = @house_number.subject
  end

end
