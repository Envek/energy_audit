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

ActiveRecord::Schema.define(:version => 20120715134425) do

  create_table "activities", :force => true do |t|
    t.string   "name",                 :null => false
    t.integer  "activity_category_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "description"
  end

  add_index "activities", ["activity_category_id"], :name => "index_activities_on_activity_category_id"
  add_index "activities", ["name"], :name => "index_activities_on_name", :unique => true

  create_table "activity_categories", :force => true do |t|
    t.string   "name",        :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
  end

  add_index "activity_categories", ["name"], :name => "index_activity_categories_on_name", :unique => true

  create_table "activity_values", :force => true do |t|
    t.integer  "period_id",                                                           :null => false
    t.integer  "subject_id",                                                          :null => false
    t.integer  "activity_id",                                                         :null => false
    t.decimal  "planned_funding",     :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "actual_funding",      :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "total_financing",     :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "regional_financing",  :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "federal_financing",   :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "municipal_financing", :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "offbudget_financing", :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "natural_economy",     :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "cost_economy",        :precision => 32, :scale => 8, :default => 0.0
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
  end

  add_index "activity_values", ["activity_id"], :name => "index_activity_values_on_activity_id"
  add_index "activity_values", ["period_id", "subject_id", "activity_id"], :name => "activity_values_main_index", :unique => true
  add_index "activity_values", ["period_id"], :name => "index_activity_values_on_period_id"
  add_index "activity_values", ["subject_id"], :name => "index_activity_values_on_subject_id"

  create_table "areas", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "areas", ["name"], :name => "index_areas_on_name", :unique => true

  create_table "audits", :force => true do |t|
    t.integer  "period_id",                                                                        :null => false
    t.integer  "subject_id",                                                                       :null => false
    t.integer  "buildings",                                                       :default => 0
    t.integer  "buildings_before",                                                :default => 0
    t.integer  "buildings_audited",                                               :default => 0
    t.integer  "contracts_count_before",                                          :default => 0
    t.integer  "contracts_count",                                                 :default => 0
    t.datetime "created_at",                                                                       :null => false
    t.datetime "updated_at",                                                                       :null => false
    t.integer  "organizations",                                                   :default => 0
    t.integer  "organizations_audit_required",                                    :default => 0
    t.integer  "organizations_before",                                            :default => 0
    t.integer  "organizations_audited",                                           :default => 0
    t.decimal  "contracts_volume",                 :precision => 32, :scale => 8, :default => 0.0
    t.integer  "ref_orgs_with_programs_count"
    t.integer  "ref_orgs_with_responsibles_count"
    t.integer  "ref_planning_economy_value"
  end

  add_index "audits", ["period_id", "subject_id"], :name => "audits_main_index", :unique => true
  add_index "audits", ["period_id"], :name => "index_audits_on_period_id"
  add_index "audits", ["subject_id"], :name => "index_audits_on_subject_id"

  create_table "consumptions", :force => true do |t|
    t.integer  "period_id",                                                                     :null => false
    t.integer  "subject_id",                                                                    :null => false
    t.integer  "resource_id",                                                                   :null => false
    t.decimal  "prev_cons_units",               :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "prev_cons_monetary",            :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "approved_year_cons_units",      :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "approved_year_cons_monetary",   :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "approved_period_cons_units",    :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "approved_period_cons_monetary", :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "actual_cons_units",             :precision => 32, :scale => 8, :default => 0.0
    t.decimal  "actual_cons_monetary",          :precision => 32, :scale => 8, :default => 0.0
    t.string   "reason"
    t.datetime "created_at",                                                                    :null => false
    t.datetime "updated_at",                                                                    :null => false
  end

  add_index "consumptions", ["period_id", "subject_id", "resource_id"], :name => "consumptions_main_index", :unique => true
  add_index "consumptions", ["period_id"], :name => "index_consumptions_on_period_id"
  add_index "consumptions", ["resource_id"], :name => "index_consumptions_on_resource_id"
  add_index "consumptions", ["subject_id"], :name => "index_consumptions_on_subject_id"

  create_table "kinds", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "kinds", ["name"], :name => "index_kinds_on_name", :unique => true

  create_table "measuring_devices", :force => true do |t|
    t.integer  "period_id",                    :null => false
    t.integer  "subject_id",                   :null => false
    t.integer  "area_id",                      :null => false
    t.integer  "kind_id",                      :null => false
    t.integer  "start_value",   :default => 0
    t.integer  "planned_value", :default => 0
    t.integer  "final_value",   :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "measuring_devices", ["area_id"], :name => "index_measuring_devices_on_area_id"
  add_index "measuring_devices", ["kind_id"], :name => "index_measuring_devices_on_kind_id"
  add_index "measuring_devices", ["period_id", "subject_id", "area_id", "kind_id"], :name => "measuring_devices_main_index", :unique => true
  add_index "measuring_devices", ["period_id"], :name => "index_measuring_devices_on_period_id"
  add_index "measuring_devices", ["subject_id"], :name => "index_measuring_devices_on_subject_id"

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
    t.string   "name",                       :null => false
    t.string   "unit",       :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
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
    t.string   "full_name",                                 :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
