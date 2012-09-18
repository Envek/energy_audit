class User::ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if params[:user][:password].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end
    @user.update_attributes(params[:user])
    if @user.save
      redirect_to user_profile_path, :notice => t("user.profiles.messages.saved")
    else
      @user.full_name = @user.full_name_was if @user.full_name.blank? # For preventing errors due to a fact, that this is current_user
      render :edit
    end
  end

end
