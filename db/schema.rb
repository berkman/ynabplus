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

ActiveRecord::Schema.define(version: 2018_11_27_192510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "account_id"
    t.string "name"
    t.string "type"
    t.boolean "on_budget"
    t.boolean "closed"
    t.string "note"
    t.decimal "balance"
    t.decimal "cleared_balance"
    t.decimal "uncleared_balance"
    t.string "transfer_payee_id"
    t.boolean "deleted"
    t.bigint "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_accounts_on_budget_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.string "budget_id"
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_id"
    t.bigint "category_group_id"
    t.string "name"
    t.boolean "hidden"
    t.string "original_category_group_id"
    t.string "note"
    t.integer "budgeted"
    t.integer "activity"
    t.integer "balance"
    t.string "goal_type"
    t.boolean "deleted"
    t.bigint "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_categories_on_budget_id"
    t.index ["category_group_id"], name: "index_categories_on_category_group_id"
  end

  create_table "category_groups", force: :cascade do |t|
    t.string "category_group_id"
    t.string "name"
    t.boolean "hidden"
    t.boolean "deleted"
    t.bigint "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_category_groups_on_budget_id"
  end

  create_table "months", force: :cascade do |t|
    t.string "month"
    t.string "note"
    t.integer "income"
    t.integer "budgeted"
    t.integer "activity"
    t.integer "to_be_budgeted"
    t.integer "age_of_money"
    t.bigint "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_months_on_budget_id"
  end

  create_table "payees", force: :cascade do |t|
    t.string "payee_id"
    t.string "name"
    t.string "transfer_account_id"
    t.boolean "deleted"
    t.bigint "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_payees_on_budget_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "budgets"
  add_foreign_key "budgets", "users"
  add_foreign_key "categories", "budgets"
  add_foreign_key "categories", "category_groups"
  add_foreign_key "category_groups", "budgets"
  add_foreign_key "months", "budgets"
  add_foreign_key "payees", "budgets"
end
