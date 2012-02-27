class Admin::Dictionaries::DictionariesController < ApplicationController
  before_filter :authenticate_admin!
end 
