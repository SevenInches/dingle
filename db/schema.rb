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

ActiveRecord::Schema.define(version: 20170409143625) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "activity_id"
    t.integer  "order_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "gender"
    t.string   "phonecall"
    t.integer  "address"
    t.integer  "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appraisals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "order_id"
    t.integer  "score"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "cate_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "cate_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "comment_id"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "appraisal_id"
    t.integer  "product_id"
    t.text     "content",      limit: 65535
    t.integer  "judge"
    t.boolean  "status"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "delivers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "order_no"
    t.float    "deliver_price", limit: 24
    t.float    "amount",        limit: 24
    t.float    "result",        limit: 24
    t.float    "discount",      limit: 24
    t.string   "trader_no"
    t.integer  "status"
    t.date     "pay_at"
    t.string   "time"
    t.integer  "pay_type"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "order_id"
    t.integer  "trader_id"
  end

  create_table "product_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.string   "image"
    t.float    "price",      limit: 24
    t.float    "discount",   limit: 24
    t.text     "info",       limit: 65535
    t.float    "evaluation", limit: 24
    t.integer  "number"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "trader_id"
  end

  create_table "trader_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "trader_id"
    t.integer  "start"
    t.float    "deliver_price", limit: 24
    t.integer  "deliver_time"
    t.float    "evaluation",    limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "traders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "title"
    t.string   "logo"
    t.boolean  "is_brand"
    t.string   "branch"
    t.text     "description", limit: 65535
    t.integer  "deliver_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "nickname"
    t.string   "phone"
    t.string   "avatar"
    t.string   "password"
    t.float    "money",      limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
