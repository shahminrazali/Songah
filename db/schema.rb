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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160928080117) do
=======
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160928043642) do
=======

ActiveRecord::Schema.define(version: 20160927051048) do


>>>>>>> master
>>>>>>> a193215005b6d42e8a14da37cc6c0d6a211c173e

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "songs", force: :cascade do |t|
    t.date     "date"
    t.string   "title"
    t.string   "artist"
    t.string   "spotify"
    t.string   "deezer"
    t.string   "image_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
<<<<<<< HEAD
    t.string   "password"
    t.date     "date_of_birth"
    t.string   "name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "password_digest"
    t.string   "password_reset_token"
    t.datetime "password_reset_at"
=======
    t.string   "username"
    t.string   "password_digest"
    t.string   "password_reset_token"
    t.datetime "password_reset_at"
    t.string   "image"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.integer  "role",                 default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
>>>>>>> master
  end

end
