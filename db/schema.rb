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

ActiveRecord::Schema.define(:version => 20101214224750) do

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

  create_table "goals", :force => true do |t|
    t.string   "name",                           :null => false
    t.text     "description"
    t.boolean  "public",      :default => false, :null => false
    t.integer  "user_id",     :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", :force => true do |t|
    t.string   "name",                                  :null => false
    t.text     "description"
    t.integer  "point_value",         :default => 0,    :null => false
    t.boolean  "visible",             :default => true, :null => false
    t.integer  "achievement_type_id", :default => 0,    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name",                            :null => false
    t.text     "description"
    t.date     "deadline"
    t.integer  "percent_complete", :default => 0, :null => false
    t.integer  "goal_id",          :default => 0, :null => false
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
