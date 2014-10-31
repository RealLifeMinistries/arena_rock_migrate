# == Schema Information
#
# Table name: core_lookup_type
#
#  lookup_type_id    :integer          not null, primary key
#  guid              :uuid             not null
#  lookup_type_name  :string(50)       not null
#  lookup_type_desc  :string(1000)     not null
#  lookup_category   :string(50)       not null
#  qualifier_1_title :string(50)       not null
#  qualifier_2_title :string(50)       not null
#  organization_id   :integer          not null
#  system_flag       :boolean          not null
#  qualifier_3_title :string(50)       not null
#  qualifier_4_title :string(50)       not null
#  qualifier_5_title :string(50)       not null
#  qualifier_6_title :string(50)       not null
#  qualifier_7_title :string(50)       not null
#  qualifier_8_title :string(50)       not null
#

class Arena::LookupType < Arena::Base
  self.table_name = :core_lookup_type
  self.primary_key = :lookup_type_id
end
