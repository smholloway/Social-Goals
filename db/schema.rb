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

ActiveRecord::Schema.define(:version => 20101216205351) do

  create_table "achievement_types", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "description"
    t.string   "icon_url"
    t.boolean  "visible",     :default => true, :null => false
    t.boolean  "active",      :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "achievements", :force => true do |t|
    t.boolean  "public",     :default => true, :null => false
    t.integer  "user_id",    :default => 0,    :null => false
    t.integer  "level_id",   :default => 0,    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "achievements", ["level_id"], :name => "index_achievements_on_level_id"
  add_index "achievements", ["user_id"], :name => "index_achievements_on_user_id"

  create_table "admins", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "goals", :force => true do |t|
    t.string   "name",                           :null => false
    t.text     "description"
    t.boolean  "public",      :default => false, :null => false
    t.integer  "user_id",     :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["user_id"], :name => "index_goals_on_user_id"

  create_table "levels", :force => true do |t|
    t.string   "name",                                  :null => false
    t.text     "description"
    t.integer  "point_value",         :default => 0,    :null => false
    t.boolean  "visible",             :default => true, :null => false
    t.integer  "achievement_type_id", :default => 0,    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "levels", ["achievement_type_id"], :name => "index_levels_on_achievement_type_id"

  create_table "tasks", :force => true do |t|
    t.string   "name",                            :null => false
    t.text     "description"
    t.date     "deadline"
    t.integer  "percent_complete", :default => 0, :null => false
    t.integer  "user_id",          :default => 0, :null => false
    t.integer  "goal_id",          :default => 0, :null => false
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["goal_id"], :name => "index_tasks_on_goal_id"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
