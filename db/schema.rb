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

ActiveRecord::Schema.define(:version => 20130412114713) do

  create_table "applications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "vacancy_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_profile_id"
  end

  add_index "applications", ["user_profile_id"], :name => "index_applications_on_user_profile_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "company_profiles", :force => true do |t|
    t.string   "name"
    t.string   "company_type"
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

  create_table "language_skills", :force => true do |t|
    t.string   "name"
    t.integer  "level"
    t.string   "type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_profile_id"
  end

  add_index "language_skills", ["user_profile_id"], :name => "index_language_skills_on_user_profile_id"

  create_table "qualifications", :force => true do |t|
    t.string   "institute_name"
    t.string   "degree_type"
    t.date     "start"
    t.date     "end"
    t.string   "address"
    t.string   "website"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_profile_id"
  end

  add_index "qualifications", ["user_profile_id"], :name => "index_qualifications_on_user_profile_id"

  create_table "references", :force => true do |t|
    t.string   "referee_name"
    t.string   "phone"
    t.string   "email"
    t.text     "referee_info"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_profile_id"
  end

  add_index "references", ["user_profile_id"], :name => "index_references_on_user_profile_id"

  create_table "tag_matches", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "vacancy_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tag_matches", ["tag_id"], :name => "index_tag_matches_on_tag_id"
  add_index "tag_matches", ["vacancy_id"], :name => "index_tag_matches_on_vacancy_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"

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
    t.string   "type"
    t.integer  "profile_id"
    t.string   "profile_type"
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
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "min_salary"
    t.integer  "max_salary"
    t.string   "job_duration"
  end

  add_index "vacancies", ["job_duration"], :name => "index_vacancies_on_job_duration"
  add_index "vacancies", ["job_type"], :name => "index_vacancies_on_job_type"

end
