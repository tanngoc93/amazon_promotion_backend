# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_02_040149) do

  create_table "active_admin_comments", charset: "utf8", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_token"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "affiliate_platforms", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "domain", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.text "description"
    t.string "link", null: false
    t.datetime "starts_at"
    t.datetime "expires_at"
    t.boolean "ended_before_deadline", default: false
    t.integer "status", default: 0
    t.float "discount_rate", default: 0.0
    t.integer "discount_rate_type", default: 0
    t.integer "number_of_clicks", default: 0
    t.integer "supplier_id"
    t.integer "product_category_id"
    t.integer "affiliate_platform_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "only_in_the_usa", default: false
    t.string "short_link"
    t.text "site_stripe_content"
    t.boolean "site_stripe", default: false
  end

  create_table "product_categories", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enable", default: true
  end

  create_table "seed_migration_data_migrations", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "version"
    t.integer "runtime"
    t.datetime "migrated_on"
  end

  create_table "suppliers", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "domain", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", collation: "utf8_bin"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

end
