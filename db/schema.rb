# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_18_091559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channel_invitations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "channel_id", null: false
    t.index ["channel_id"], name: "index_channel_invitations_on_channel_id"
    t.index ["user_id"], name: "index_channel_invitations_on_user_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "resource_type", null: false
    t.bigint "resource_id", null: false
    t.string "state"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_type", "resource_id"], name: "index_notifications_on_resource_type_and_resource_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "team_channel_messages", force: :cascade do |t|
    t.bigint "channel_id"
    t.bigint "team_id"
    t.string "content", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_team_channel_messages_on_channel_id"
    t.index ["team_id"], name: "index_team_channel_messages_on_team_id"
    t.index ["user_id"], name: "index_team_channel_messages_on_user_id"
  end

  create_table "team_channels", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_team_channels_on_slug"
    t.index ["team_id"], name: "index_team_channels_on_team_id"
  end

  create_table "team_invitations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_invitations_on_team_id"
    t.index ["user_id"], name: "index_team_invitations_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.string "slug"
    t.text "description", null: false
    t.integer "channels_count", default: 0, null: false
    t.integer "users_count", default: 0, null: false
    t.string "state"
    t.index ["owner_id"], name: "index_teams_on_owner_id"
    t.index ["slug"], name: "index_teams_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "channel_invitations", "team_channels", column: "channel_id"
  add_foreign_key "channel_invitations", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "team_channel_messages", "team_channels", column: "channel_id"
  add_foreign_key "team_channel_messages", "teams"
  add_foreign_key "team_channel_messages", "users"
  add_foreign_key "team_channels", "teams"
  add_foreign_key "team_invitations", "teams"
  add_foreign_key "team_invitations", "users"
end
