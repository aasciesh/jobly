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

ActiveRecord::Schema.define(:version => 20130328191328) do

  create_table "applications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "vacancy_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "company_profiles", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.text     "description"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.integer  "zip"
    t.string   "website"
    t.text     "contact"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "experiences", :force => true do |t|
    t.string   "employer"
    t.string   "full_address"
    t.string   "business_field"
    t.string   "position"
    t.text     "responsibilities"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "langauge_skills", :force => true do |t|
    t.string   "name"
    t.integer  "level"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "qualifications", :force => true do |t|
    t.string   "institute_name"
    t.string   "degree_type"
    t.date     "start"
    t.date     "end"
    t.string   "address"
    t.string   "website"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "references", :force => true do |t|
    t.string   "referee_name"
    t.string   "phone"
    t.string   "email"
    t.text     "referee_info"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sub_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_profiles", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birth_date"
    t.string   "gender"
    t.string   "full_address"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.integer  "zip"
    t.text     "self_info"
    t.text     "hobbies"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "rememeber_cookie"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "vacancies", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "deadline"
    t.string   "job_type"
    t.string   "job_address"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.integer  "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
