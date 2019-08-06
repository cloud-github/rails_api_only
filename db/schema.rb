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

ActiveRecord::Schema.define(version: 2019_06_11_114039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "btree_gin"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "call_verifications", force: :cascade do |t|
    t.string "uuid"
    t.integer "code"
    t.datetime "expiration_date"
    t.integer "verified"
    t.string "from"
    t.string "to"
    t.json "gateway_data", default: {}
    t.integer "gateway"
    t.integer "member_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "gateway"], name: "index_call_verifications_on_organization_id_and_gateway"
    t.index ["uuid"], name: "index_call_verifications_on_uuid", unique: true
  end

  create_table "cards", force: :cascade do |t|
    t.string "cardable_type"
    t.bigint "cardable_id"
    t.boolean "default", default: true
    t.integer "exp_month"
    t.integer "exp_year"
    t.string "stripe_id"
    t.json "stripe_data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cardable_type", "cardable_id"], name: "index_cards_on_cardable_type_and_cardable_id"
    t.index ["default"], name: "index_cards_on_default"
    t.index ["exp_month"], name: "index_cards_on_exp_month"
    t.index ["exp_year"], name: "index_cards_on_exp_year"
    t.index ["stripe_id"], name: "index_cards_on_stripe_id", unique: true
  end

  create_table "clearbit_data", force: :cascade do |t|
    t.string "email"
    t.json "response", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organization_id"
    t.index ["organization_id", "email"], name: "index_clearbit_data_on_organization_id_and_email", unique: true
    t.index ["organization_id"], name: "index_clearbit_data_on_organization_id"
  end

  create_table "data_uploads", force: :cascade do |t|
    t.integer "member_id"
    t.json "headers", default: {}
    t.json "enrichment_info", default: {}
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "validation_info", default: {}
    t.integer "organization_id"
    t.json "error", default: {}
    t.string "header_error"
    t.string "processing"
    t.json "row_errors", default: {}
    t.integer "row_errors_count"
    t.index ["member_id"], name: "index_data_uploads_on_member_id"
    t.index ["organization_id"], name: "index_data_uploads_on_organization_id"
  end

  create_table "everyone_api_data", force: :cascade do |t|
    t.string "phone_number"
    t.json "response", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organization_id"
    t.index ["organization_id", "phone_number"], name: "index_everyone_api_data_on_organization_id_and_phone_number", unique: true
    t.index ["organization_id"], name: "index_everyone_api_data_on_organization_id"
  end

  create_table "fibernetics_numbers", force: :cascade do |t|
    t.integer "number"
    t.string "friendly_name"
    t.integer "area_code"
    t.integer "number_type"
    t.string "country_code"
    t.integer "price"
    t.boolean "assigned", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_fibernetics_numbers_on_number", unique: true
  end

  create_table "group_people", force: :cascade do |t|
    t.integer "group_id"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id", "person_id"], name: "index_group_people_on_group_id_and_person_id", unique: true
    t.index ["group_id"], name: "index_group_people_on_group_id"
    t.index ["person_id"], name: "index_group_people_on_person_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "member_id"
    t.integer "organization_id"
    t.integer "group_people_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_groups_on_member_id"
    t.index ["organization_id", "name"], name: "index_groups_on_organization_id_and_name", unique: true
    t.index ["organization_id"], name: "index_groups_on_organization_id"
  end

  create_table "hosted_numbers", force: :cascade do |t|
    t.string "number"
    t.string "contract_id"
    t.json "esignatures_data", default: {}
    t.string "bandwidth_id"
    t.xml "bandwidth_data"
    t.string "call_verification_id"
    t.string "bandwidth_status"
    t.datetime "notification_at"
    t.integer "member_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_hosted_numbers_on_organization_id"
  end

  create_table "invites", force: :cascade do |t|
    t.string "email"
    t.text "message"
    t.string "team_ids"
    t.integer "status"
    t.integer "organization_id"
    t.integer "member_id"
    t.index ["member_id"], name: "index_invites_on_member_id"
    t.index ["organization_id", "email"], name: "index_invites_on_organization_id_and_email"
    t.index ["organization_id"], name: "index_invites_on_organization_id"
  end

  create_table "macro_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "macros", force: :cascade do |t|
    t.string "name"
    t.integer "macro_type"
    t.text "subject"
    t.text "body"
    t.integer "macro_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["macro_category_id"], name: "index_macros_on_macro_category_id"
  end

  create_table "member_settings", force: :cascade do |t|
    t.integer "member_id"
    t.json "settings", default: {}
    t.index ["member_id"], name: "index_member_settings_on_member_id", unique: true
  end

  create_table "members", force: :cascade do |t|
    t.string "title"
    t.integer "organization_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "user_id"], name: "index_members_on_organization_id_and_user_id", unique: true
    t.index ["organization_id"], name: "index_members_on_organization_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "merge_variables", force: :cascade do |t|
    t.string "data_key"
    t.string "data_type"
    t.integer "category"
    t.string "fallback_value"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "only_filter", default: false
    t.index ["organization_id", "category", "data_key"], name: "idx_organization_category_data_key", unique: true
    t.index ["organization_id"], name: "index_merge_variables_on_organization_id"
  end

  create_table "number_groups", force: :cascade do |t|
    t.string "name"
    t.string "assignable_type"
    t.bigint "assignable_id"
    t.integer "organization_id"
    t.integer "member_id"
    t.string "forward_to"
    t.integer "numbers_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignable_type", "assignable_id"], name: "index_number_groups_on_assignable_type_and_assignable_id"
    t.index ["member_id"], name: "index_number_groups_on_member_id"
    t.index ["organization_id", "name"], name: "index_number_groups_on_organization_id_and_name", unique: true
    t.index ["organization_id"], name: "index_number_groups_on_organization_id"
  end

  create_table "number_orders", force: :cascade do |t|
    t.json "numbers", default: {}
    t.integer "number_type"
    t.string "country"
    t.integer "gateway"
    t.integer "status"
    t.integer "total"
    t.integer "failed", default: 0
    t.integer "member_id"
    t.integer "organization_id"
    t.integer "number_group_id"
    t.datetime "notified_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_number_orders_on_member_id"
    t.index ["organization_id"], name: "index_number_orders_on_organization_id"
  end

  create_table "numbers", force: :cascade do |t|
    t.string "number"
    t.string "friendly_name"
    t.integer "number_type"
    t.string "country", default: "US"
    t.integer "gateway"
    t.json "gateway_data", default: {}
    t.string "forward_to"
    t.string "assignable_type"
    t.bigint "assignable_id"
    t.integer "organization_id"
    t.integer "member_id"
    t.integer "number_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignable_type", "assignable_id"], name: "index_numbers_on_assignable_type_and_assignable_id"
    t.index ["member_id"], name: "index_numbers_on_member_id"
    t.index ["number"], name: "index_numbers_on_number", unique: true
    t.index ["number_group_id"], name: "index_numbers_on_number_group_id"
    t.index ["organization_id"], name: "index_numbers_on_organization_id"
  end

  create_table "office_hours", force: :cascade do |t|
    t.json "hours", default: {}
    t.integer "enabled", default: 0
    t.integer "organization_id"
    t.string "workable_type"
    t.bigint "workable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_office_hours_on_organization_id"
    t.index ["workable_type", "workable_id"], name: "index_office_hours_on_workable_type_and_workable_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.string "category"
    t.string "use_for"
    t.string "team_size"
    t.string "country"
    t.string "timezone"
    t.string "support_email"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "support_phone_number"
    t.string "website"
    t.string "linkedin"
    t.string "facebook"
    t.string "twitter"
    t.string "SMS_output_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "groups_count", default: 0
    t.integer "people_count", default: 0
  end

  create_table "people", force: :cascade do |t|
    t.string "email", default: ""
    t.string "phone_number", default: ""
    t.jsonb "custom_data", default: {}, null: false
    t.integer "member_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "national_format"
    t.index ["member_id"], name: "index_people_on_member_id"
    t.index ["organization_id", "custom_data"], name: "index_people_on_organization_id_and_custom_data", using: :gin
    t.index ["organization_id", "email", "phone_number"], name: "index_people_on_organization_id_and_email_and_phone_number", unique: true
    t.index ["organization_id"], name: "index_people_on_organization_id"
  end

  create_table "platform_plan_features", force: :cascade do |t|
    t.json "features", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platform_plans", force: :cascade do |t|
    t.string "nickname"
    t.integer "amount"
    t.string "currency"
    t.integer "interval"
    t.integer "interval_count"
    t.integer "plan_type"
    t.integer "platform_product_id"
    t.integer "platform_plan_feature_id"
    t.string "stripe_id"
    t.json "stripe_data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_plan_feature_id"], name: "index_platform_plans_on_platform_plan_feature_id"
    t.index ["platform_product_id"], name: "index_platform_plans_on_platform_product_id"
    t.index ["stripe_id"], name: "index_platform_plans_on_stripe_id", unique: true
  end

  create_table "platform_products", force: :cascade do |t|
    t.string "name"
    t.integer "product_type"
    t.string "statement_descriptor"
    t.string "stripe_id"
    t.json "stripe_data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_id"], name: "index_platform_products_on_stripe_id", unique: true
  end

  create_table "platform_subscriptions", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "status"
    t.string "stripe_id"
    t.json "stripe_data", default: {}
    t.integer "stripe_customer_id"
    t.integer "stripe_coupon_id"
    t.json "subscription_features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_platform_subscriptions_on_organization_id"
    t.index ["status"], name: "index_platform_subscriptions_on_status"
    t.index ["stripe_coupon_id"], name: "index_platform_subscriptions_on_stripe_coupon_id"
    t.index ["stripe_customer_id"], name: "index_platform_subscriptions_on_stripe_customer_id"
    t.index ["stripe_id"], name: "index_platform_subscriptions_on_stripe_id", unique: true
  end

  create_table "stripe_coupons", force: :cascade do |t|
    t.string "name"
    t.integer "organization_id"
    t.string "stripe_id"
    t.json "stripe_data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "name"], name: "index_stripe_coupons_on_organization_id_and_name", unique: true
    t.index ["organization_id"], name: "index_stripe_coupons_on_organization_id"
    t.index ["stripe_id"], name: "index_stripe_coupons_on_stripe_id", unique: true
  end

  create_table "stripe_customers", force: :cascade do |t|
    t.string "currency"
    t.string "customer_type"
    t.bigint "customer_id"
    t.string "stripe_id"
    t.json "stripe_data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_type", "customer_id", "currency"], name: "by_customer_currency", unique: true
    t.index ["stripe_id"], name: "index_stripe_customers_on_stripe_id", unique: true
  end

  create_table "stripe_invoices", force: :cascade do |t|
    t.string "subscription_type"
    t.bigint "subscription_id"
    t.string "stripe_id"
    t.json "stripe_data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_id"], name: "index_stripe_invoices_on_stripe_id", unique: true
    t.index ["subscription_type", "subscription_id"], name: "index_stripe_invoices_on_subscription_type_and_subscription_id"
  end

  create_table "subscription_plans", force: :cascade do |t|
    t.boolean "active", default: true
    t.integer "quantity", default: 1
    t.string "subscription_type"
    t.bigint "subscription_id"
    t.string "plan_type"
    t.bigint "plan_id"
    t.string "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_type", "plan_id"], name: "by_plan"
    t.index ["stripe_id"], name: "index_subscription_plans_on_stripe_id", unique: true
    t.index ["subscription_type", "subscription_id"], name: "by_subscription"
  end

  create_table "team_members", force: :cascade do |t|
    t.integer "team_id"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_team_members_on_member_id"
    t.index ["team_id", "member_id"], name: "index_team_members_on_team_id_and_member_id", unique: true
    t.index ["team_id"], name: "index_team_members_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "organization_id"
    t.integer "member_id"
    t.integer "team_members_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_teams_on_member_id"
    t.index ["organization_id", "name"], name: "index_teams_on_organization_id_and_name", unique: true
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.string "host"
    t.integer "category", default: 0
    t.json "db_config", default: {}
    t.json "settings", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host"], name: "index_tenants_on_host", unique: true
    t.index ["name"], name: "index_tenants_on_name", unique: true
  end

  create_table "twilio_data", force: :cascade do |t|
    t.string "phone_number"
    t.json "response", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organization_id"
    t.index ["organization_id", "phone_number"], name: "index_twilio_data_on_organization_id_and_phone_number", unique: true
    t.index ["organization_id"], name: "index_twilio_data_on_organization_id"
    t.index ["phone_number"], name: "index_twilio_data_on_phone_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "email"
    t.string "full_name"
    t.string "phone_number"
    t.string "work_phone"
    t.integer "role"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
