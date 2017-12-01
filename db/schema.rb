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

ActiveRecord::Schema.define(version: 20171130110208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "statut",     default: "En cours"
    t.string   "message"
    t.integer  "profile_id"
    t.integer  "cheval_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["cheval_id"], name: "index_bookings_on_cheval_id", using: :btree
    t.index ["profile_id"], name: "index_bookings_on_profile_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chevals", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "taille"
    t.integer  "price"
    t.integer  "pattes"
    t.integer  "profile_id"
    t.integer  "robe_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "ville"
    t.string   "rue"
    t.string   "photo"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["category_id"], name: "index_chevals_on_category_id", using: :btree
    t.index ["profile_id"], name: "index_chevals_on_profile_id", using: :btree
    t.index ["robe_id"], name: "index_chevals_on_robe_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "photo"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "content"
    t.integer  "rating"
    t.integer  "profile_id"
    t.integer  "cheval_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cheval_id"], name: "index_reviews_on_cheval_id", using: :btree
    t.index ["profile_id"], name: "index_reviews_on_profile_id", using: :btree
  end

  create_table "robes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bookings", "chevals"
  add_foreign_key "bookings", "profiles"
  add_foreign_key "chevals", "categories"
  add_foreign_key "chevals", "profiles"
  add_foreign_key "chevals", "robes"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "chevals"
  add_foreign_key "reviews", "profiles"
end
