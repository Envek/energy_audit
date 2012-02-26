class Admin::Users::UsersController < ApplicationController
  before_filter :authenticate_admin!
  active_scaffold :user do |conf|
    conf.list.columns = [:email, :full_name]
    conf.update.columns = [:email, :full_name, :password, :password_confirmation]
    conf.create.columns = [:email, :full_name, :password, :password_confirmation]
  end
end 
