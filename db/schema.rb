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

ActiveRecord::Schema.define(version: 20170124213829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exp_settings", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "partnerSecret"
    t.string   "partnerId"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_exp_settings_on_organization_id", using: :btree
  end

  create_table "imported_expenses", force: :cascade do |t|
    t.string   "transactionID"
    t.boolean  "unverified"
    t.string   "cardID"
    t.string   "reportID"
    t.integer  "mcc"
    t.string   "tag"
    t.string   "currency"
    t.boolean  "billable"
    t.integer  "amount"
    t.datetime "inserted"
    t.boolean  "reimbursable"
    t.string   "details"
    t.integer  "currencyConversionRate"
    t.datetime "created"
    t.integer  "modifiedAmount"
    t.string   "bank"
    t.string   "receiptID"
    t.string   "receiptFilename"
    t.datetime "modifiedCreated"
    t.string   "merchant"
    t.string   "externalID"
    t.integer  "convertedAmount"
    t.boolean  "modified"
    t.string   "category"
    t.string   "modifiedMerchant"
    t.string   "comment"
    t.string   "cardNumber"
    t.integer  "transactionHash"
    t.string   "modifiedMCC"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "exp_settings", "organizations"
end
