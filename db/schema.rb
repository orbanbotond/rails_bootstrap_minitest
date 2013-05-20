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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130505091409) do

  create_table "agreements", :force => true do |t|
    t.string   "agreement_type"
    t.string   "erp_supplier_name"
    t.string   "erp_supplier_number"
    t.string   "refresh_basis"
    t.boolean  "active"
    t.text     "comment"
    t.integer  "client_id"
    t.integer  "supplier_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.time     "deleted_at"
    t.integer  "prices_count"
    t.text     "website_url"
    t.text     "website_user_id"
    t.text     "website_password"
  end

  add_index "agreements", ["client_id"], :name => "index_agreements_on_client_id"
  add_index "agreements", ["supplier_id"], :name => "index_agreements_on_supplier_id"

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "ac_number"
    t.string   "authentication_key"
    t.string   "category_schema"
    t.string   "account_status"
    t.text     "comment"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.time     "deleted_at"
    t.integer  "purchasing_system_id"
    t.integer  "system_version_id"
  end

  add_index "clients", ["ac_number"], :name => "index_clients_on_ac_number"
  add_index "clients", ["purchasing_system_id"], :name => "index_clients_on_purchasing_system_id"
  add_index "clients", ["system_version_id"], :name => "index_clients_on_system_version_id"

  create_table "erronous_rows", :force => true do |t|
    t.integer  "file_import_id"
    t.string   "message"
    t.integer  "row_nr"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "erronous_rows", ["file_import_id"], :name => "index_erronous_rows_on_file_import_id"

  create_table "file_imports", :force => true do |t|
    t.string   "path"
    t.integer  "agreement_id"
    t.string   "status"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "state"
    t.integer  "products_imported"
  end

  add_index "file_imports", ["agreement_id"], :name => "index_file_imports_on_agreement_id"

  create_table "prices", :force => true do |t|
    t.float    "price"
    t.integer  "agreement_id"
    t.integer  "product_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.text     "supplier_part_number"
    t.string   "unit_of_measurement_code", :limit => 5
    t.string   "unit_of_measurement",      :limit => 25
    t.string   "available"
  end

  add_index "prices", ["agreement_id"], :name => "index_prices_on_agreement_id"
  add_index "prices", ["product_id"], :name => "index_prices_on_product_id"

  create_table "products", :force => true do |t|
    t.text     "short_description"
    t.text     "long_description"
    t.string   "currency",                 :limit => 3
    t.text     "manufacturer_part_number"
    t.text     "manufacturer_name"
    t.string   "thumbnail_url"
    t.string   "image_url"
    t.string   "commodity_code",           :limit => 250
    t.text     "commodity_name"
    t.text     "attribute_1_name"
    t.text     "attribute_1_value"
    t.text     "attribute_2_name"
    t.text     "attribute_2_value"
    t.text     "attribute_3_name"
    t.text     "attribute_3_value"
    t.text     "attribute_4_name"
    t.text     "attribute_4_value"
    t.text     "attribute_5_name"
    t.text     "attribute_5_value"
    t.text     "attribute_6_name"
    t.text     "attribute_6_value"
    t.text     "attribute_7_name"
    t.text     "attribute_7_value"
    t.text     "attribute_8_name"
    t.text     "attribute_8_value"
    t.text     "attribute_9_name"
    t.text     "attribute_9_value"
    t.text     "attribute_10_name"
    t.text     "attribute_10_value"
    t.text     "attribute_11_name"
    t.text     "attribute_11_value"
    t.text     "attribute_12_name"
    t.text     "attribute_12_value"
    t.text     "attribute_13_name"
    t.text     "attribute_13_value"
    t.text     "attribute_14_name"
    t.text     "attribute_14_value"
    t.text     "attribute_15_name"
    t.text     "attribute_15_value"
    t.text     "attribute_16_name"
    t.text     "attribute_16_value"
    t.text     "attribute_17_name"
    t.text     "attribute_17_value"
    t.text     "attribute_18_name"
    t.text     "attribute_18_value"
    t.text     "attribute_19_name"
    t.text     "attribute_19_value"
    t.text     "attribute_20_name"
    t.text     "attribute_20_value"
    t.text     "attribute_21_name"
    t.text     "attribute_21_value"
    t.text     "attribute_22_name"
    t.text     "attribute_22_value"
    t.text     "attribute_23_name"
    t.text     "attribute_23_value"
    t.text     "attribute_24_name"
    t.text     "attribute_24_value"
    t.text     "attribute_25_name"
    t.text     "attribute_25_value"
    t.text     "attribute_26_name"
    t.text     "attribute_26_value"
    t.text     "attribute_27_name"
    t.text     "attribute_27_value"
    t.text     "attribute_28_name"
    t.text     "attribute_28_value"
    t.text     "attribute_29_name"
    t.text     "attribute_29_value"
    t.text     "attribute_30_name"
    t.text     "attribute_30_value"
    t.text     "attribute_31_name"
    t.text     "attribute_31_value"
    t.text     "attribute_32_name"
    t.text     "attribute_32_value"
    t.text     "attribute_33_name"
    t.text     "attribute_33_value"
    t.text     "attribute_34_name"
    t.text     "attribute_34_value"
    t.text     "attribute_35_name"
    t.text     "attribute_35_value"
    t.text     "attribute_36_name"
    t.text     "attribute_36_value"
    t.text     "attribute_37_name"
    t.text     "attribute_37_value"
    t.text     "attribute_38_name"
    t.text     "attribute_38_value"
    t.text     "attribute_39_name"
    t.text     "attribute_39_value"
    t.text     "attribute_40_name"
    t.text     "attribute_40_value"
    t.text     "attribute_41_name"
    t.text     "attribute_41_value"
    t.text     "attribute_42_name"
    t.text     "attribute_42_value"
    t.text     "attribute_43_name"
    t.text     "attribute_43_value"
    t.text     "attribute_44_name"
    t.text     "attribute_44_value"
    t.text     "attribute_45_name"
    t.text     "attribute_45_value"
    t.text     "attribute_46_name"
    t.text     "attribute_46_value"
    t.text     "attribute_47_name"
    t.text     "attribute_47_value"
    t.text     "attribute_48_name"
    t.text     "attribute_48_value"
    t.text     "attribute_49_name"
    t.text     "attribute_49_value"
    t.text     "attribute_50_name"
    t.text     "attribute_50_value"
    t.text     "attribute_51_name"
    t.text     "attribute_51_value"
    t.text     "attribute_52_name"
    t.text     "attribute_52_value"
    t.text     "attribute_53_name"
    t.text     "attribute_53_value"
    t.text     "attribute_54_name"
    t.text     "attribute_54_value"
    t.text     "attribute_55_name"
    t.text     "attribute_55_value"
    t.text     "attribute_56_name"
    t.text     "attribute_56_value"
    t.text     "attribute_57_name"
    t.text     "attribute_57_value"
    t.text     "attribute_58_name"
    t.text     "attribute_58_value"
    t.text     "attribute_59_name"
    t.text     "attribute_59_value"
    t.text     "attribute_60_name"
    t.text     "attribute_60_value"
    t.text     "attribute_61_name"
    t.text     "attribute_61_value"
    t.text     "attribute_62_name"
    t.text     "attribute_62_value"
    t.text     "attribute_63_name"
    t.text     "attribute_63_value"
    t.text     "attribute_64_name"
    t.text     "attribute_64_value"
    t.text     "attribute_65_name"
    t.text     "attribute_65_value"
    t.text     "attribute_66_name"
    t.text     "attribute_66_value"
    t.text     "attribute_67_name"
    t.text     "attribute_67_value"
    t.text     "attribute_68_name"
    t.text     "attribute_68_value"
    t.text     "attribute_69_name"
    t.text     "attribute_69_value"
    t.text     "attribute_70_name"
    t.text     "attribute_70_value"
    t.text     "attribute_71_name"
    t.text     "attribute_71_value"
    t.text     "attribute_72_name"
    t.text     "attribute_72_value"
    t.text     "attribute_73_name"
    t.text     "attribute_73_value"
    t.text     "attribute_74_name"
    t.text     "attribute_74_value"
    t.text     "attribute_75_name"
    t.text     "attribute_75_value"
    t.text     "attribute_76_name"
    t.text     "attribute_76_value"
    t.text     "attribute_77_name"
    t.text     "attribute_77_value"
    t.text     "attribute_78_name"
    t.text     "attribute_78_value"
    t.text     "attribute_79_name"
    t.text     "attribute_79_value"
    t.text     "attribute_80_name"
    t.text     "attribute_80_value"
    t.text     "attribute_81_name"
    t.text     "attribute_81_value"
    t.text     "attribute_82_name"
    t.text     "attribute_82_value"
    t.text     "attribute_83_name"
    t.text     "attribute_83_value"
    t.text     "attribute_84_name"
    t.text     "attribute_84_value"
    t.text     "attribute_85_name"
    t.text     "attribute_85_value"
    t.text     "attribute_86_name"
    t.text     "attribute_86_value"
    t.text     "attribute_87_name"
    t.text     "attribute_87_value"
    t.text     "attribute_88_name"
    t.text     "attribute_88_value"
    t.text     "attribute_89_name"
    t.text     "attribute_89_value"
    t.text     "attribute_90_name"
    t.text     "attribute_90_value"
    t.text     "attribute_91_name"
    t.text     "attribute_91_value"
    t.text     "attribute_92_name"
    t.text     "attribute_92_value"
    t.text     "attribute_93_name"
    t.text     "attribute_93_value"
    t.text     "attribute_94_name"
    t.text     "attribute_94_value"
    t.text     "attribute_95_name"
    t.text     "attribute_95_value"
    t.text     "attribute_96_name"
    t.text     "attribute_96_value"
    t.text     "attribute_97_name"
    t.text     "attribute_97_value"
    t.text     "attribute_98_name"
    t.text     "attribute_98_value"
    t.text     "attribute_99_name"
    t.text     "attribute_99_value"
    t.text     "attribute_100_name"
    t.text     "attribute_100_value"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.time     "deleted_at"
  end

  create_table "purchasing_systems", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "search_audits", :force => true do |t|
    t.text     "incoming"
    t.text     "outgoing"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "ac_number"
    t.string   "website"
    t.boolean  "catalog_exists"
    t.boolean  "active"
    t.text     "comment"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.time     "deleted_at"
  end

  add_index "suppliers", ["ac_number"], :name => "index_suppliers_on_ac_number"

  create_table "system_versions", :force => true do |t|
    t.string   "name"
    t.integer  "purchasing_system_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "system_versions", ["purchasing_system_id"], :name => "index_system_versions_on_purchasing_system_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "role"
    t.integer  "administratable_id"
    t.string   "administratable_type"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.time     "deleted_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
