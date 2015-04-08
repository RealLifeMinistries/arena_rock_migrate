# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150114213706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "arena_addresses", primary_key: "address_id", force: :cascade do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.float    "Latitude"
    t.float    "Longitude"
    t.integer  "standardize_code"
    t.string   "standardize_msg"
    t.integer  "foreign_key"
    t.float    "XAxis"
    t.float    "YAxis"
    t.float    "ZAxis"
    t.datetime "date_geocoded"
    t.datetime "date_standardized"
    t.integer  "area_id"
    t.string   "geocode_service"
    t.integer  "geocode_status"
    t.string   "route"
    t.string   "dpbc"
    t.string   "lot"
    t.string   "endorsement_line"
    t.string   "container_label"
    t.string   "country"
  end

  create_table "arena_areas", primary_key: "area_id", force: :cascade do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
    t.integer  "organization_id"
    t.string   "area_name"
    t.string   "area_description"
    t.integer  "map_width"
    t.integer  "map_height"
    t.integer  "thumb_blob_id"
    t.integer  "image_blob_id"
    t.integer  "large_blob_id"
    t.float    "min_latitude"
    t.float    "max_latitude"
    t.float    "min_longitude"
    t.float    "max_longitude"
    t.boolean  "refresh_required"
    t.integer  "foreign_key"
    t.datetime "date_refreshed"
    t.uuid     "guid"
  end

  create_table "arena_attribute_groups", primary_key: "attribute_group_id", force: :cascade do |t|
    t.uuid     "guid"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
    t.integer  "organization_id"
    t.boolean  "system_flag"
    t.string   "group_name"
    t.integer  "group_order"
    t.integer  "display_location"
  end

  create_table "arena_attribute_types", force: :cascade do |t|
    t.string "name"
    t.string "type"
  end

  create_table "arena_attributes", primary_key: "attribute_id", force: :cascade do |t|
    t.uuid     "guid"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
    t.integer  "attribute_group_id"
    t.string   "attribute_name"
    t.integer  "attribute_type"
    t.integer  "attribute_order"
    t.boolean  "visible"
    t.boolean  "required"
    t.string   "type_qualifier"
    t.boolean  "readonly"
    t.boolean  "system_flag"
  end

  create_table "arena_campuses", primary_key: "campus_id", force: :cascade do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",       limit: 255
    t.string   "modified_by",      limit: 255
    t.uuid     "guid"
    t.integer  "organization_id"
    t.string   "name",             limit: 255
    t.string   "url",              limit: 255
    t.string   "description",      limit: 255
    t.integer  "leader_person_id"
    t.integer  "address_id"
    t.integer  "foreign_key"
  end

  create_table "arena_families", primary_key: "family_id", force: :cascade do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
    t.string   "family_name"
    t.integer  "foreign_key"
    t.integer  "organization_id"
  end

  create_table "arena_family_members", primary_key: "family_id", force: :cascade do |t|
    t.integer  "person_id",     null: false
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
    t.integer  "role_luid"
  end

  create_table "arena_genders", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "arena_lookup_types", primary_key: "lookup_type_id", force: :cascade do |t|
    t.uuid    "guid"
    t.string  "lookup_type_name"
    t.string  "lookup_type_desc"
    t.string  "lookup_category"
    t.string  "qualifier_1_title"
    t.string  "qualifier_2_title"
    t.integer "organization_id"
    t.boolean "system_flag"
    t.string  "qualifier_3_title"
    t.string  "qualifier_4_title"
    t.string  "qualifier_5_title"
    t.string  "qualifier_6_title"
    t.string  "qualifier_7_title"
    t.string  "qualifier_8_title"
  end

  create_table "arena_lookups", primary_key: "lookup_id", force: :cascade do |t|
    t.uuid    "guid"
    t.integer "lookup_type_id"
    t.string  "lookup_value"
    t.string  "lookup_qualifier"
    t.string  "lookup_qualifier2"
    t.string  "lookup_qualifier3"
    t.string  "lookup_qualifier4"
    t.string  "lookup_qualifier5"
    t.string  "lookup_qualifier6"
    t.string  "lookup_qualifier7"
    t.string  "lookup_qualifier8"
    t.integer "lookup_order"
    t.boolean "active"
    t.boolean "system_flag"
    t.integer "foreign_key"
  end

  create_table "arena_occurrence_attendance", primary_key: "occurrence_attendance_id", force: :cascade do |t|
    t.integer  "occurrence_id"
    t.integer  "person_id"
    t.string   "security_code"
    t.boolean  "attended"
    t.datetime "check_in_time"
    t.datetime "check_out_time"
    t.string   "notes"
    t.string   "pager"
    t.integer  "session_id"
    t.integer  "type"
  end

  create_table "arena_occurrence_types", primary_key: "occurrence_type_id", force: :cascade do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
    t.integer  "type_order"
    t.string   "type_name"
    t.decimal  "min_age",                       precision: 9, scale: 2
    t.decimal  "max_age",                       precision: 9, scale: 2
    t.string   "age_range_text"
    t.string   "schema_file_path"
    t.boolean  "photo_confirmation"
    t.boolean  "location_specific_occurrences"
    t.integer  "sync_with_profile"
    t.integer  "sync_with_cluster"
    t.boolean  "membership_required"
    t.boolean  "use_altid_for_family"
    t.boolean  "is_service"
    t.integer  "group_id"
    t.integer  "merge_days"
    t.integer  "gender_preference"
    t.integer  "sync_with_group"
    t.boolean  "checkout_required"
    t.boolean  "secured"
    t.integer  "theme_id"
    t.boolean  "allow_unknown_age"
    t.boolean  "min_grade"
    t.integer  "max_grade"
    t.boolean  "pager_required"
    t.integer  "profile_source_luid"
    t.integer  "profile_status_luid"
    t.datetime "min_birth_date"
    t.datetime "max_birth_date"
    t.boolean  "use_room_ratios"
    t.integer  "leader_profile_id"
    t.integer  "people_per_leader"
    t.integer  "min_leaders"
  end

  create_table "arena_occurrences", primary_key: "occurrence_id", force: :cascade do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
    t.string   "occurrence_name"
    t.string   "occurrence_description"
    t.datetime "occurrence_start_time"
    t.datetime "occurrence_end_time"
    t.datetime "check_in_start"
    t.datetime "check_in_end"
    t.string   "location"
    t.integer  "location_id"
    t.boolean  "mission_related"
    t.integer  "occurrence_type"
    t.integer  "location_address_id"
    t.integer  "membership_required"
    t.integer  "occurrence_type_template_id"
    t.integer  "area_id"
    t.boolean  "occurrence_closed"
    t.integer  "foreign_key"
  end

  create_table "arena_people", primary_key: "person_id", force: :cascade do |t|
    t.uuid     "guid"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.datetime "date_last_verified"
    t.string   "created_by"
    t.string   "modified_by"
    t.integer  "title_luid"
    t.string   "nick_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "suffix_luid"
    t.datetime "birth_date"
    t.integer  "gender"
    t.string   "postal_code"
    t.string   "Notes"
    t.integer  "marital_status"
    t.datetime "anniversary_date"
    t.integer  "record_status"
    t.string   "medical_information"
    t.integer  "blob_id"
    t.integer  "inactive_reason_luid"
    t.integer  "foreign_key"
    t.integer  "foreign_key2"
    t.integer  "organization_id"
    t.integer  "active_meter"
    t.datetime "last_attended"
    t.boolean  "contribute_individually"
    t.string   "giving_unit_id"
    t.datetime "graduation_date"
    t.binary   "social_security"
    t.boolean  "print_statement"
    t.integer  "envelope_number"
    t.boolean  "include_on_envelope"
    t.boolean  "staff_member"
    t.integer  "campus_id"
    t.boolean  "business"
    t.integer  "member_status"
  end

  create_table "arena_person_addresses", primary_key: "person_id", force: :cascade do |t|
    t.integer  "address_id",        null: false
    t.integer  "address_type_luid", null: false
    t.boolean  "primary_address"
    t.datetime "active_date"
    t.datetime "inactive_date"
    t.string   "from_month_day"
    t.string   "to_month_day"
    t.string   "notes"
  end

  create_table "arena_person_attributes", primary_key: "person_id", force: :cascade do |t|
    t.integer  "attribute_id",                            null: false
    t.integer  "int_value"
    t.string   "varchar_value"
    t.datetime "datetime_value"
    t.decimal  "decimal_value",  precision: 18, scale: 4
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
  end

  create_table "arena_person_emails", primary_key: "email_id", force: :cascade do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
    t.integer  "person_id"
    t.boolean  "active"
    t.integer  "email_order"
    t.string   "email"
    t.string   "notes"
  end

  create_table "arena_person_phones", primary_key: "person_id", force: :cascade do |t|
    t.integer "phone_luid",            null: false
    t.string  "phone_number"
    t.string  "phone_ext"
    t.boolean "unlisted"
    t.string  "phone_number_stripped"
    t.boolean "sms_enabled"
  end

  create_table "arena_profile_members", primary_key: "profile_id", force: :cascade do |t|
    t.integer  "person_id",     null: false
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
    t.integer  "source_luid"
    t.integer  "status_luid"
    t.string   "notes"
    t.datetime "date_pending"
    t.datetime "date_inreview"
    t.datetime "date_active"
    t.datetime "date_dormant"
  end

  create_table "arena_profile_types", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "arena_profiles", primary_key: "profile_id", force: :cascade do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
    t.integer  "profile_type"
    t.integer  "organization_id"
    t.integer  "department_id"
    t.integer  "parent_profile_id"
    t.integer  "owner_id"
    t.string   "profile_name"
    t.string   "profile_desc"
    t.string   "notes"
    t.boolean  "active"
    t.integer  "display_order"
    t.string   "foreign_key"
    t.boolean  "category_level"
    t.integer  "blob_id"
    t.integer  "qualifier"
    t.integer  "owner_relationship_strength"
    t.integer  "peer_relationship_strength"
    t.uuid     "guid"
    t.integer  "campus_id"
  end

  create_table "arena_record_statuses", force: :cascade do |t|
    t.string "name", null: false
  end

