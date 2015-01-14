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

  create_table "arena_addresses", primary_key: "address_id", force: true do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",        limit: nil
    t.string   "modified_by",       limit: nil
    t.string   "street_address_1",  limit: nil
    t.string   "street_address_2",  limit: nil
    t.string   "city",              limit: nil
    t.string   "state",             limit: nil
    t.string   "postal_code",       limit: nil
    t.float    "Latitude"
    t.float    "Longitude"
    t.integer  "standardize_code"
    t.string   "standardize_msg",   limit: nil
    t.integer  "foreign_key"
    t.float    "XAxis"
    t.float    "YAxis"
    t.float    "ZAxis"
    t.datetime "date_geocoded"
    t.datetime "date_standardized"
    t.integer  "area_id"
    t.string   "geocode_service",   limit: nil
    t.integer  "geocode_status"
    t.string   "route",             limit: nil
    t.string   "dpbc",              limit: nil
    t.string   "lot",               limit: nil
    t.string   "endorsement_line",  limit: nil
    t.string   "container_label",   limit: nil
    t.string   "country",           limit: nil
  end

  create_table "arena_areas", primary_key: "area_id", force: true do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",       limit: nil
    t.string   "modified_by",      limit: nil
    t.integer  "organization_id"
    t.string   "area_name",        limit: nil
    t.string   "area_description", limit: nil
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

  create_table "arena_attribute_groups", primary_key: "attribute_group_id", force: true do |t|
    t.uuid     "guid"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",       limit: nil
    t.string   "modified_by",      limit: nil
    t.integer  "organization_id"
    t.boolean  "system_flag"
    t.string   "group_name",       limit: nil
    t.integer  "group_order"
    t.integer  "display_location"
  end

  create_table "arena_attribute_types", force: true do |t|
    t.string "name", limit: nil
    t.string "type", limit: nil
  end

  create_table "arena_attributes", primary_key: "attribute_id", force: true do |t|
    t.uuid     "guid"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",         limit: nil
    t.string   "modified_by",        limit: nil
    t.integer  "attribute_group_id"
    t.string   "attribute_name",     limit: nil
    t.integer  "attribute_type"
    t.integer  "attribute_order"
    t.boolean  "visible"
    t.boolean  "required"
    t.string   "type_qualifier",     limit: nil
    t.boolean  "readonly"
    t.boolean  "system_flag"
  end

  create_table "arena_campuses", primary_key: "campus_id", force: true do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by"
    t.string   "modified_by"
    t.uuid     "guid"
    t.integer  "organization_id"
    t.string   "name"
    t.string   "url"
    t.string   "description"
    t.integer  "leader_person_id"
    t.integer  "address_id"
    t.integer  "foreign_key"
  end

  create_table "arena_families", primary_key: "family_id", force: true do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",      limit: nil
    t.string   "modified_by",     limit: nil
    t.string   "family_name",     limit: nil
    t.integer  "foreign_key"
    t.integer  "organization_id"
  end

  create_table "arena_family_members", primary_key: "family_id", force: true do |t|
    t.integer  "person_id",                 null: false
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",    limit: nil
    t.string   "modified_by",   limit: nil
    t.integer  "role_luid"
  end

  create_table "arena_genders", force: true do |t|
    t.string "name", limit: nil, null: false
  end

  create_table "arena_lookup_types", primary_key: "lookup_type_id", force: true do |t|
    t.uuid    "guid"
    t.string  "lookup_type_name",  limit: nil
    t.string  "lookup_type_desc",  limit: nil
    t.string  "lookup_category",   limit: nil
    t.string  "qualifier_1_title", limit: nil
    t.string  "qualifier_2_title", limit: nil
    t.integer "organization_id"
    t.boolean "system_flag"
    t.string  "qualifier_3_title", limit: nil
    t.string  "qualifier_4_title", limit: nil
    t.string  "qualifier_5_title", limit: nil
    t.string  "qualifier_6_title", limit: nil
    t.string  "qualifier_7_title", limit: nil
    t.string  "qualifier_8_title", limit: nil
  end

  create_table "arena_lookups", primary_key: "lookup_id", force: true do |t|
    t.uuid    "guid"
    t.integer "lookup_type_id"
    t.string  "lookup_value",      limit: nil
    t.string  "lookup_qualifier",  limit: nil
    t.string  "lookup_qualifier2", limit: nil
    t.string  "lookup_qualifier3", limit: nil
    t.string  "lookup_qualifier4", limit: nil
    t.string  "lookup_qualifier5", limit: nil
    t.string  "lookup_qualifier6", limit: nil
    t.string  "lookup_qualifier7", limit: nil
    t.string  "lookup_qualifier8", limit: nil
    t.integer "lookup_order"
    t.boolean "active"
    t.boolean "system_flag"
    t.integer "foreign_key"
  end

  create_table "arena_occurrence_attendance", primary_key: "occurrence_attendance_id", force: true do |t|
    t.integer  "occurrence_id"
    t.integer  "person_id"
    t.string   "security_code",  limit: nil
    t.boolean  "attended"
    t.datetime "check_in_time"
    t.datetime "check_out_time"
    t.string   "notes",          limit: nil
    t.string   "pager",          limit: nil
    t.integer  "session_id"
    t.integer  "type"
  end

  create_table "arena_occurrence_types", primary_key: "occurrence_type_id", force: true do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",                    limit: nil
    t.string   "modified_by",                   limit: nil
    t.integer  "type_order"
    t.string   "type_name",                     limit: nil
    t.decimal  "min_age",                                   precision: 9, scale: 2
    t.decimal  "max_age",                                   precision: 9, scale: 2
    t.string   "age_range_text",                limit: nil
    t.string   "schema_file_path",              limit: nil
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

  create_table "arena_occurrences", primary_key: "occurrence_id", force: true do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",                  limit: nil
    t.string   "modified_by",                 limit: nil
    t.string   "occurrence_name",             limit: nil
    t.string   "occurrence_description",      limit: nil
    t.datetime "occurrence_start_time"
    t.datetime "occurrence_end_time"
    t.datetime "check_in_start"
    t.datetime "check_in_end"
    t.string   "location",                    limit: nil
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

  create_table "arena_people", primary_key: "person_id", force: true do |t|
    t.uuid     "guid"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.datetime "date_last_verified"
    t.string   "created_by",              limit: nil
    t.string   "modified_by",             limit: nil
    t.integer  "title_luid"
    t.string   "nick_name",               limit: nil
    t.string   "first_name",              limit: nil
    t.string   "middle_name",             limit: nil
    t.string   "last_name",               limit: nil
    t.integer  "suffix_luid"
    t.datetime "birth_date"
    t.integer  "gender"
    t.string   "postal_code",             limit: nil
    t.string   "Notes",                   limit: nil
    t.integer  "marital_status"
    t.datetime "anniversary_date"
    t.integer  "record_status"
    t.string   "medical_information",     limit: nil
    t.integer  "blob_id"
    t.integer  "inactive_reason_luid"
    t.integer  "foreign_key"
    t.integer  "foreign_key2"
    t.integer  "organization_id"
    t.integer  "active_meter"
    t.datetime "last_attended"
    t.boolean  "contribute_individually"
    t.string   "giving_unit_id",          limit: nil
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

  create_table "arena_person_addresses", primary_key: "person_id", force: true do |t|
    t.integer  "address_id",                    null: false
    t.integer  "address_type_luid",             null: false
    t.boolean  "primary_address"
    t.datetime "active_date"
    t.datetime "inactive_date"
    t.string   "from_month_day",    limit: nil
    t.string   "to_month_day",      limit: nil
    t.string   "notes",             limit: nil
  end

  create_table "arena_person_attributes", primary_key: "person_id", force: true do |t|
    t.integer  "attribute_id",                                        null: false
    t.integer  "int_value"
    t.string   "varchar_value",  limit: nil
    t.datetime "datetime_value"
    t.decimal  "decimal_value",              precision: 18, scale: 4
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",     limit: nil
    t.string   "modified_by",    limit: nil
  end

  create_table "arena_person_emails", primary_key: "email_id", force: true do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",    limit: nil
    t.string   "modified_by",   limit: nil
    t.integer  "person_id"
    t.boolean  "active"
    t.integer  "email_order"
    t.string   "email",         limit: nil
    t.string   "notes",         limit: nil
  end

  create_table "arena_person_phones", primary_key: "person_id", force: true do |t|
    t.integer "phone_luid",                        null: false
    t.string  "phone_number",          limit: nil
    t.string  "phone_ext",             limit: nil
    t.boolean "unlisted"
    t.string  "phone_number_stripped", limit: nil
    t.boolean "sms_enabled"
  end

  create_table "arena_profile_members", primary_key: "profile_id", force: true do |t|
    t.integer  "person_id",                 null: false
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",    limit: nil
    t.string   "modified_by",   limit: nil
    t.integer  "source_luid"
    t.integer  "status_luid"
    t.string   "notes",         limit: nil
    t.datetime "date_pending"
    t.datetime "date_inreview"
    t.datetime "date_active"
    t.datetime "date_dormant"
  end

  create_table "arena_profile_types", force: true do |t|
    t.string "name"
  end

  create_table "arena_profiles", primary_key: "profile_id", force: true do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",                  limit: nil
    t.string   "modified_by",                 limit: nil
    t.integer  "profile_type"
    t.integer  "organization_id"
    t.integer  "department_id"
    t.integer  "parent_profile_id"
    t.integer  "owner_id"
    t.string   "profile_name",                limit: nil
    t.string   "profile_desc",                limit: nil
    t.string   "notes",                       limit: nil
    t.boolean  "active"
    t.integer  "display_order"
    t.string   "foreign_key",                 limit: nil
    t.boolean  "category_level"
    t.integer  "blob_id"
    t.integer  "qualifier"
    t.integer  "owner_relationship_strength"
    t.integer  "peer_relationship_strength"
    t.uuid     "guid"
    t.integer  "campus_id"
  end

  create_table "arena_record_statuses", force: true do |t|
    t.string "name", limit: nil, null: false
  end

  create_table "arena_relationship_types", primary_key: "relationship_type_id", force: true do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",                   limit: nil
    t.string   "modified_by",                  limit: nil
    t.integer  "organization_id"
    t.string   "relationship",                 limit: nil
    t.integer  "relationship_order"
    t.integer  "inverse_relationship_type_id"
    t.integer  "peer_relationship_strength"
  end

  create_table "arena_relationships", primary_key: "relationship_id", force: true do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",           limit: nil
    t.string   "modified_by",          limit: nil
    t.integer  "relationship_type_id"
    t.integer  "person_id"
    t.integer  "related_person_id"
  end

  create_table "arena_small_group_clusters", primary_key: "group_cluster_id", force: true do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",            limit: nil
    t.string   "modified_by",           limit: nil
    t.integer  "organization_id"
    t.integer  "parent_cluster_id"
    t.integer  "leader_person_id"
    t.integer  "admin_person_id"
    t.string   "cluster_name",          limit: nil
    t.string   "cluster_url",           limit: nil
    t.string   "cluster_desc",          limit: nil
    t.string   "cluster_notes",         limit: nil
    t.integer  "foreign_region_key"
    t.integer  "foreign_subregion_key"
    t.integer  "cluster_type_id"
    t.integer  "cluster_level"
    t.integer  "image_blob_id"
    t.integer  "area_id"
    t.boolean  "active"
    t.uuid     "guid"
  end

  create_table "arena_small_group_members", primary_key: "group_id", force: true do |t|
    t.integer  "person_id",                  null: false
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",     limit: nil
    t.string   "modified_by",    limit: nil
    t.integer  "role_luid"
    t.datetime "date_joined"
    t.string   "notes",          limit: nil
    t.integer  "uniform_number"
    t.boolean  "active"
  end

  create_table "arena_small_group_occurrences", primary_key: "group_id", force: true do |t|
    t.integer "occurrence_id", null: false
  end

  create_table "arena_small_groups", primary_key: "group_id", force: true do |t|
    t.datetime "date_created"
    t.datetime "date_modified"
    t.string   "created_by",                  limit: nil
    t.string   "modified_by",                 limit: nil
    t.integer  "group_cluster_id"
    t.integer  "leader_person_id"
    t.string   "group_name",                  limit: nil
    t.string   "group_url",                   limit: nil
    t.string   "group_desc",                  limit: nil
    t.string   "group_notes",                 limit: nil
    t.integer  "max_members"
    t.integer  "topic_luid"
    t.integer  "meeting_day_luid"
    t.integer  "primary_age_luid"
    t.integer  "primary_marital_status_luid",             default: "nextval('arena_small_groups_primary_marital_status_luid_seq'::regclass)", null: false
    t.integer  "foreign_key"
    t.integer  "target_location_person_id"
    t.string   "picture_url",                 limit: nil
    t.string   "schedule",                    limit: nil
    t.integer  "group_type_luid"
    t.integer  "image_blob_id"
    t.uuid     "guid"
    t.boolean  "is_group_private"
    t.boolean  "active"
  end

  create_table "mappings", force: true do |t|
    t.string   "arena_record_type", limit: nil, null: false
    t.string   "arena_record_id",   limit: nil, null: false
    t.string   "rock_record_type",  limit: nil, null: false
    t.string   "rock_record_id",    limit: nil, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mappings", ["arena_record_type", "arena_record_id"], name: "arena_records", unique: true, using: :btree
  add_index "mappings", ["rock_record_type", "rock_record_id"], name: "rock_records", unique: true, using: :btree

  create_table "rock_attendance", primary_key: "Id", force: true do |t|
    t.integer  "LocationId"
    t.integer  "ScheduleId"
    t.integer  "GroupId"
    t.integer  "DeviceId"
    t.integer  "SearchTypeValueId"
    t.integer  "AttendanceCodeId"
    t.integer  "QualifierValueId"
    t.datetime "StartDateTime"
    t.datetime "EndDateTime"
    t.boolean  "DidAttend"
    t.string   "Note",                    limit: nil
    t.uuid     "Guid"
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.string   "ForeignId",               limit: nil
    t.integer  "CampusId"
    t.integer  "PersonAliasId"
  end

  create_table "rock_attribute_categories", primary_key: "AttributeId", force: true do |t|
    t.integer "CategoryId", null: false
  end

  create_table "rock_attribute_qualifiers", primary_key: "Id", force: true do |t|
    t.boolean "IsSystem",                null: false
    t.integer "AttributeId",             null: false
    t.string  "Key",         limit: nil, null: false
    t.string  "Value",       limit: nil
    t.uuid    "Guid",                    null: false
    t.string  "ForeignId",   limit: nil
  end

  create_table "rock_attribute_values", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem"
    t.integer  "AttributeId"
    t.integer  "EntityId"
    t.string   "Value",                   limit: nil
    t.uuid     "Guid"
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.string   "ForeignId",               limit: nil
    t.datetime "ValueAsDateTime"
    t.decimal  "ValueAsNumeric",                      precision: 38, scale: 10
  end

  create_table "rock_attributes", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem"
    t.integer  "FieldTypeId"
    t.integer  "EntityTypeId"
    t.string   "EntityTypeQualifierColumn", limit: nil
    t.string   "EntityTypeQualifierValue",  limit: nil
    t.string   "Key",                       limit: nil
    t.string   "Name",                      limit: nil
    t.string   "Description",               limit: nil
    t.integer  "Order"
    t.boolean  "IsGridColumn"
    t.string   "DefaultValue",              limit: nil
    t.boolean  "IsMultiValue"
    t.boolean  "IsRequired"
    t.uuid     "Guid"
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.integer  "ForeignId"
    t.string   "IconCssClass",              limit: nil
  end

  create_table "rock_campus", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem"
    t.string   "Name",                    limit: nil
    t.string   "ShortCode",               limit: nil
    t.integer  "LocationId"
    t.uuid     "Guid"
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.integer  "ForeignId"
    t.string   "PhoneNumber",             limit: nil
    t.integer  "LeaderPersonAliasId"
    t.string   "ServiceTimes",            limit: nil
    t.string   "Description",             limit: nil
    t.boolean  "IsActive"
    t.string   "Url",                     limit: nil
  end

  create_table "rock_campuses", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem",                null: false
    t.string   "Name",                    null: false
    t.string   "ShortCode"
    t.integer  "LocationId"
    t.uuid     "Guid",                    null: false
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.string   "ForeignId"
    t.string   "PhoneNumber"
    t.integer  "LeaderPersonAliasId"
    t.string   "ServiceTimes"
    t.string   "Description"
    t.boolean  "IsActive"
    t.string   "Url"
  end

  create_table "rock_categories", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem"
    t.integer  "ParentCategoryId"
    t.integer  "EntityTypeId"
    t.string   "EntityTypeQualifierColumn", limit: nil
    t.string   "EntityTypeQualifierValue",  limit: nil
    t.string   "Name",                      limit: nil
    t.string   "IconCssClass",              limit: nil
    t.uuid     "Guid"
    t.integer  "Order"
    t.string   "Description",               limit: nil
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.integer  "ForeignId"
    t.string   "HighlightColor",            limit: nil
  end

  create_table "rock_defined_types", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem"
    t.integer  "FieldTypeId"
    t.integer  "Order"
    t.string   "Name",                    limit: nil
    t.string   "Description",             limit: nil
    t.uuid     "Guid"
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.integer  "ForeignId"
    t.text     "HelpText"
    t.integer  "CategoryId"
  end

  create_table "rock_defined_values", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem"
    t.integer  "DefinedTypeId"
    t.integer  "Order"
    t.string   "Value",                   limit: nil
    t.string   "Description",             limit: nil
    t.uuid     "Guid"
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.string   "ForeignId",               limit: nil
  end

  create_table "rock_entity_types", primary_key: "Id", force: true do |t|
    t.string  "Name",                   limit: nil
    t.string  "AssemblyName",           limit: nil
    t.string  "FriendlyName",           limit: nil
    t.boolean "IsEntity"
    t.boolean "IsSecured"
    t.boolean "IsCommon"
    t.uuid    "Guid"
    t.integer "ForeignId"
    t.integer "SingleValueFieldTypeId"
    t.integer "MultiValueFieldTypeId"
  end

  create_table "rock_field_types", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem"
    t.string   "Name",                    limit: nil
    t.string   "Description",             limit: nil
    t.string   "Assembly",                limit: nil
    t.string   "Class",                   limit: nil
    t.uuid     "Guid"
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.integer  "ForeignId"
  end

  create_table "rock_genders", force: true do |t|
    t.string "name", limit: nil, null: false
  end

  create_table "rock_group_locations", primary_key: "Id", force: true do |t|
    t.integer  "GroupId",                              null: false
    t.integer  "LocationId",                           null: false
    t.integer  "GroupLocationTypeValueId"
    t.boolean  "IsMailingLocation",                    null: false
    t.boolean  "IsMappedLocation",                     null: false
    t.uuid     "Guid",                                 null: false
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.integer  "GroupMemberPersonAliasId"
    t.string   "ForeignId",                limit: nil
  end

  create_table "rock_group_member_statuses", force: true do |t|
    t.string "name", limit: nil
  end

  create_table "rock_group_members", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem"
    t.integer  "GroupId"
    t.integer  "PersonId"
    t.integer  "GroupRoleId"
    t.integer  "GroupMemberStatus"
    t.uuid     "Guid"
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.string   "ForeignId",               limit: nil
    t.integer  "GuestCount"
  end

  create_table "rock_group_type_roles", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem"
    t.integer  "GroupTypeId"
    t.string   "Name",                    limit: nil
    t.string   "Description",             limit: nil
    t.integer  "Order"
    t.integer  "MaxCount"
    t.integer  "MinCount"
    t.integer  "IsLeader"
    t.uuid     "Guid"
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.string   "ForeignId",               limit: nil
  end

  create_table "rock_group_types", primary_key: "Id", force: true do |t|
    t.integer  "IsSystem"
    t.string   "Name",                    limit: nil
    t.string   "Description",             limit: nil
    t.string   "GroupTerm",               limit: nil
    t.string   "GroupMemberTerm",         limit: nil
    t.integer  "DefaultGroupRoleId"
    t.boolean  "AllowMultipleLocations"
    t.boolean  "ShowInGroupList"
    t.boolean  "ShowInNavigation"
    t.string   "IconCssClass",            limit: nil
    t.boolean  "TakesAttendance"
    t.integer  "AttendanceRule"
    t.integer  "AttendancePrintTo"
    t.integer  "Order"
    t.integer  "InheritedGroupTypeId"
    t.integer  "LocationSelectionMode"
    t.integer  "GroupTypePurposeValueId"
    t.uuid     "Guid"
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.string   "ForeignId",               limit: nil
    t.boolean  "EnableLocationSchedules"
  end

  create_table "rock_groups", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem",                            null: false
    t.integer  "ParentGroupId"
    t.integer  "GroupTypeId",                         null: false
    t.integer  "CampusId"
    t.string   "Name",                    limit: nil, null: false
    t.string   "Description",             limit: nil
    t.boolean  "IsSecurityRole",                      null: false
    t.boolean  "IsActive",                            null: false
    t.integer  "Order",                               null: false
    t.uuid     "Guid",                                null: false
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.integer  "ForeignId"
    t.boolean  "AllowGuests"
  end

  create_table "rock_locations", primary_key: "Id", force: true do |t|
    t.integer  "ParentLocationId"
    t.string   "Name",                            limit: nil
    t.boolean  "IsActive"
    t.integer  "LocationTypeValueId"
    t.binary   "GeoPoint"
    t.binary   "GeoFence"
    t.string   "Street1",                         limit: nil
    t.string   "Street2",                         limit: nil
    t.string   "City",                            limit: nil
    t.string   "State",                           limit: nil
    t.string   "Country",                         limit: nil
    t.string   "AssessorParcelId",                limit: nil
    t.datetime "StandardizeAttemptedDateTime"
    t.string   "StandardizeAttemptedServiceType", limit: nil
    t.string   "StandardizeAttemptedResult",      limit: nil
    t.datetime "StandardizedDateTime"
    t.datetime "GeocodeAttemptedDateTime"
    t.string   "GeocodeAttemptedServiceType",     limit: nil
    t.string   "GeocodeAttemptedResult",          limit: nil
    t.datetime "GeocodedDateTime"
    t.integer  "PrinterDeviceId"
    t.uuid     "Guid"
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.boolean  "IsGeoPointLocked"
    t.string   "ForeignId",                       limit: nil
    t.integer  "ImageId"
    t.string   "PostalCode",                      limit: nil
  end

  create_table "rock_people", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem"
    t.integer  "RecordTypeValueId"
    t.integer  "RecordStatusValueId"
    t.integer  "RecordStatusReasonValueId"
    t.integer  "ConnectionStatusValueId"
    t.boolean  "IsDeceased"
    t.integer  "TitleValueId"
    t.string   "FirstName",                 limit: nil
    t.string   "NickName",                  limit: nil
    t.string   "MiddleName",                limit: nil
    t.string   "LastName",                  limit: nil
    t.integer  "SuffixValueId"
    t.integer  "PhotoId"
    t.integer  "BirthDay"
    t.integer  "BirthMonth"
    t.integer  "BirthYear"
    t.integer  "Gender"
    t.integer  "MaritalStatusValueId"
    t.date     "AnniversaryDate"
    t.date     "GraduationDate"
    t.integer  "GivingGroupId"
    t.string   "Email",                     limit: nil
    t.boolean  "IsEmailActive"
    t.string   "EmailNote",                 limit: nil
    t.string   "SystemNote",                limit: nil
    t.integer  "ViewedCount"
    t.uuid     "Guid"
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.date     "BirthDate"
    t.integer  "EmailPreference"
    t.string   "InactiveReasonNote",        limit: nil
    t.string   "ForeignId",                 limit: 1
    t.integer  "ReviewReasonValueId"
    t.string   "ReviewReasonNote",          limit: nil
  end

  create_table "rock_person_aliases", primary_key: "Id", force: true do |t|
    t.string  "Name",            limit: nil
    t.integer "PersonId"
    t.integer "AliasPersonId"
    t.uuid    "AliasPersonGuid"
    t.uuid    "Guid"
    t.string  "ForeignId",       limit: nil
  end

  create_table "rock_phone_numbers", primary_key: "Id", force: true do |t|
    t.boolean  "IsSystem",                            null: false
    t.integer  "PersonId",                            null: false
    t.string   "Number",                  limit: nil, null: false
    t.string   "Extension",               limit: nil
    t.integer  "NumberTypeValueId"
    t.boolean  "IsMessagingEnabled",                  null: false
    t.boolean  "IsUnlisted",                          null: false
    t.string   "Description",             limit: nil
    t.uuid     "Guid",                                null: false
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.string   "CountryCode",             limit: nil
    t.string   "ForeignId",               limit: nil
    t.string   "NumberFormatted",         limit: nil
  end

  create_table "rock_schedules", primary_key: "Id", force: true do |t|
    t.string   "Name",                      limit: nil
    t.string   "Description",               limit: nil
    t.string   "iCalendarContent",          limit: nil
    t.integer  "CheckInStartOffsetMinutes"
    t.integer  "CheckInEndOffsetMinutes"
    t.date     "EffectiveStartDate"
    t.date     "EffectiveEndDate"
    t.integer  "CategoryId"
    t.uuid     "Guid",                                  null: false
    t.datetime "CreatedDateTime"
    t.datetime "ModifiedDateTime"
    t.integer  "CreatedByPersonAliasId"
    t.integer  "ModifiedByPersonAliasId"
    t.string   "ForeignId",                 limit: nil
  end

end
