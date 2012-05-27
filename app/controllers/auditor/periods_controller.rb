class Auditor::PeriodsController < AuditorController
  active_scaffold :period do |conf|
    conf.columns = [:date, :published]
    conf.show.link = false
    conf.action_links.add :set_current, :label => I18n.t("auditor.periods.index.set_current"), :type => :member, :page => true, :parameters => {:method => :post}
  end

  def set_current
    session[:period] = Period.find(params[:id])
    redirect_to auditor_periods_path, :notice => t("auditor.periods.messages.period_changed")
  end

end 
