class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  active_scaffold :user do |conf|
    conf.list.columns = [:email, :full_name, :admin]
    conf.update.columns = [:email, :full_name, :password, :password_confirmation]
    conf.create.columns = [:email, :full_name, :password, :password_confirmation]
    conf.nested.add_link(:operator_subjects)
  end
end
