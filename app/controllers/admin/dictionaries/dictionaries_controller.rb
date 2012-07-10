class Admin::Dictionaries::DictionariesController < ApplicationController
  before_filter :authenticate_user!
end 
