class OperatorsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def change_period_and_subject
    @period = Period.from_param(params[:period_id])
    @subject = Subject.find(params[:subject_id])
    session[:period_id] = @period.to_param
    session[:subject_id] = @subject.id
    type = params[:type].match(/\A[a-zA-z]+\Z/).nil?? "measuring_devices" : params[:type]
    redirect_to url_for(:controller => "operator/#{type}", :action => :index, :period_id => @period.to_param, :subject_id => @subject.id), :notice => t("messages.settings_saved")
  end

end
