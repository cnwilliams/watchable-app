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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170410181344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "list_movies", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_list_movies_on_list_id", using: :btree
    t.index ["movie_id"], name: "index_list_movies_on_movie_id", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.string   "title"
    t.string   "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_lists_on_user_id", using: :btree
  end

  create_table "movies", force: :cascade do |t|
    t.integer  "guidebox_id"
    t.string   "title"
    t.integer  "release_date"
    t.string   "rating"
    t.string   "overview"
    t.string   "primary_genre"
    t.string   "secondary_genre"
    t.string   "tertiary_genre"
    t.string   "primary_free_name"
    t.string   "primary_free_link"
    t.string   "secondary_free_name"
    t.string   "secondary_free_link"
    t.string   "primary_web_source_name"
    t.string   "primary_web_source_link"
    t.string   "secondary_web_source_name"
    t.string   "secondary_web_source_link"
    t.string   "primary_sub_source_name"
    t.string   "primary_sub_source_link"
    t.string   "secondary_sub_source_name"
    t.string   "secondary_sub_source_link"
    t.string   "cs_media_link"
    t.string   "trailer"
    t.string   "sm_img"
    t.string   "md_img"
    t.string   "lg_img"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "list_movies", "lists"
  add_foreign_key "list_movies", "movies"
  add_foreign_key "lists", "users"
end
