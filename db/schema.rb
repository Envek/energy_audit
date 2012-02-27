# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120227111826) do

  create_table "activities", :force => true do |t|
    t.string   "name",                 :null => false
    t.integer  "activity_category_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "activities", ["activity_category_id"], :name => "index_activities_on_activity_category_id"
  add_index "activities", ["name"], :name => "index_activities_on_name", :unique => true

  create_table "activity_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "activity_categories", ["name"], :name => "index_activity_categories_on_name", :unique => true

  create_table "areas", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "areas", ["name"], :name => "index_areas_on_name", :unique => true

  create_table "kinds", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "kinds", ["name"], :name => "index_kinds_on_name", :unique => true

  create_table "operator_subjects", :force => true do |t|
    t.integer  "operator_id"
    t.integer  "subject_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "operator_subjects", ["operator_id", "subject_id"], :name => "index_operator_subjects_on_operator_id_and_subject_id", :unique => true
  add_index "operator_subjects", ["operator_id"], :name => "index_operator_subjects_on_operator_id"
  add_index "operator_subjects", ["subject_id"], :name => "index_operator_subjects_on_subject_id"

  create_table "periods", :force => true do |t|
    t.date     "date",                          :null => false
    t.boolean  "published",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "periods", ["date"], :name => "index_periods_on_date", :unique => true

  create_table "resources", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "resources", ["name"], :name => "index_resources_on_name", :unique => true

  create_table "subjects", :force => true do |t|
    t.string   "name",                                   :null => false
    t.string   "type",       :default => "Organisation"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "subjects", ["name"], :name => "index_subjects_on_name", :unique => true
  add_index "subjects", ["type", "name"], :name => "index_subjects_on_type_and_name"

  create_table "users", :force => true do |t|
    t.string   "full_name",                                      :null => false
    t.string   "type",                   :default => "Operator", :null => false
    t.string   "email",                  :default => "",         :null => false
    t.string   "encrypted_password",     :default => "",         :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
