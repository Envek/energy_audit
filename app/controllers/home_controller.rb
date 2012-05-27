class HomeController < ApplicationController

  def index
    if operator_signed_in?
      redirect_to operator_root_path
    elsif auditor_signed_in?
      redirect_to auditor_root_path
    elsif admin_signed_in?
      redirect_to admin_root_path
    end
  end

end
