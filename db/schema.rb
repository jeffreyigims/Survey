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

ActiveRecord::Schema.define(version: 2020_06_29_133430) do

  create_table "brokers", force: :cascade do |t|
    t.string "name"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_brokers_on_company_id"
  end

  create_table "carrier_contacts", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "notes"
    t.boolean "active"
    t.integer "contact_id", null: false
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_carrier_contacts_on_carrier_id"
    t.index ["contact_id"], name: "index_carrier_contacts_on_contact_id"
  end

  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "club_contacts", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "notes"
    t.boolean "active"
    t.integer "contact_id", null: false
    t.integer "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_contacts_on_club_id"
    t.index ["contact_id"], name: "index_club_contacts_on_contact_id"
  end

  create_table "club_groups", force: :cascade do |t|
    t.integer "club_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_groups_on_club_id"
    t.index ["group_id"], name: "index_club_groups_on_group_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.integer "league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_clubs_on_league_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "notes"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coverage_brokers", force: :cascade do |t|
    t.integer "broker_id", null: false
    t.integer "coverage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["broker_id"], name: "index_coverage_brokers_on_broker_id"
    t.index ["coverage_id"], name: "index_coverage_brokers_on_coverage_id"
  end

  create_table "coverage_carriers", force: :cascade do |t|
    t.integer "carrier_id", null: false
    t.integer "coverage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_coverage_carriers_on_carrier_id"
    t.index ["coverage_id"], name: "index_coverage_carriers_on_coverage_id"
  end

  create_table "coverages", force: :cascade do |t|
    t.boolean "has_coverage_line"
    t.string "notes"
    t.date "start_date"
    t.date "end_date"
    t.integer "club_group_id", null: false
    t.integer "sub_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_group_id"], name: "index_coverages_on_club_group_id"
    t.index ["sub_category_id"], name: "index_coverages_on_sub_category_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.integer "sport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_leagues_on_sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

end
