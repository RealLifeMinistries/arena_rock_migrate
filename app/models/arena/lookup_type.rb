# == Schema Information
#
# Table name: core_lookup_type
#
#  lookup_type_id    :integer          not null, primary key
#  guid              :uuid             not null
#  lookup_type_name  :varchar(50)      not null
#  lookup_type_desc  :varchar(1000)    not null
#  lookup_category   :varchar(50)      not null
#  qualifier_1_title :varchar(50)      not null
#  qualifier_2_title :varchar(50)      not null
#  organization_id   :integer          not null
#  system_flag       :boolean          not null
#  qualifier_3_title :varchar(50)      not null
#  qualifier_4_title :varchar(50)      not null
#  qualifier_5_title :varchar(50)      not null
#  qualifier_6_title :varchar(50)      not null
#  qualifier_7_title :varchar(50)      not null
#  qualifier_8_title :varchar(50)      not null
#

class Arena::LookupType < Arena::Base
  self.table_name = :core_lookup_type
  self.primary_key = :lookup_type_id
end
