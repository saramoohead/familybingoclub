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

ActiveRecord::Schema.define(version: 20170424222736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "code"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_boards_on_code", unique: true, using: :btree
  end

  create_table "boards_squares", id: false, force: :cascade do |t|
    t.integer "board_id",  null: false
    t.integer "square_id", null: false
    t.index ["board_id", "square_id"], name: "index_boards_squares_on_board_id_and_square_id", using: :btree
  end

  create_table "squares", force: :cascade do |t|
    t.datetime "called_timestamp"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "category"
    t.string   "description"
    t.string   "creator"
    t.string   "local_src"
    t.string   "organisation"
    t.boolean  "exclude"
    t.integer  "number"
  end

end
