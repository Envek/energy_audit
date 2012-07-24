class Operator::AuditsController < OperatorsController

  def index
    @audit = Audit.where(:period_id => @period.id, :subject_id => @subject.id).first
  end

  def new
    authorize! :create, Audit
    @audit = Audit.new
  end

  def create
    Audit.transaction do
      begin
        @audit = Audit.new(params[:audit])
        @audit.period = @period
        @audit.subject = @subject
        authorize! :create, @audit
        @audit.save!
      rescue ActiveRecord::RecordInvalid
        render :new
        raise ActiveRecord::Rollback
      else
        redirect_to url_for(:action => :index), :notice => t("operator.audits.messages.created")
      end
    end
  end

  def edit
    @audit = Audit.where(:period_id => @period.id, :subject_id => @subject.id).first
    authorize! :update, @audit
    redirect_to :action => :new and return unless @audit
  end

  def update
    Audit.transaction do
      begin
        @audit = Audit.where(:period_id => @period.id, :subject_id => @subject.id).first
        @audit.update_attributes(params[:audit])
        authorize! :update, @audit
        @audit.save!
      rescue ActiveRecord::RecordInvalid
        render :edit
        raise ActiveRecord::Rollback
      else
        redirect_to url_for(:action => :index), :notice => t("operator.audits.messages.saved")
      end
    end
  end

  def destroy
    @audit = Audit.find(params[:id])
    authorize! :delete, @audit
    @audit.destroy
    redirect_to url_for(:action => :index), :notice => t("operator.audits.messages.removed")
  end

end
