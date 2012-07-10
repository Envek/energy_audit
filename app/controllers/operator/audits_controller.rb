class Operator::AuditsController < OperatorsController

  def index
    @current_audit = Audit.where(:period_id => @period.id, :subject_id => @subject.id).first
  end

  def new
    @current_audit = Audit.new
  end

  def create
    Audit.transaction do
      begin
        audit = Audit.new(params[:audit])
        audit.period = @period
        audit.subject = @subject
        audit.save!
      rescue ActiveRecord::RecordInvalid
        render :new, :notice => "Invalid records"
        raise ActiveRecord::Rollback
      else
        redirect_to url_for(:action => :index), :notice => "Created"
      end
    end
  end

  def edit
    audit = Audit.where(:period_id => @period.id, :subject_id => @subject.id)
    redirect_to :action => :new and return if audit.count.zero?
    @current_audit = audit.first
  end

  def update
    Audit.transaction do
      begin
        audit = Audit.where(:period_id => @period.id, :subject_id => @subject.id).first
        audit.update_attributes(params[:audit])
        audit.save!
      rescue ActiveRecord::RecordInvalid
        render :edit, :error => "Invalid records"
        raise ActiveRecord::Rollback
      else
        redirect_to url_for(:action => :index), :notice => "Saved"
      end
    end
  end

  def destroy
    audit = Audit.find(params[:id])
    audit.destroy
    redirect_to url_for(:action => :index), :notice => "Deleted"
  end

end
