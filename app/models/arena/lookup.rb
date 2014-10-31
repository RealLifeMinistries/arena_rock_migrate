# == Schema Information
#
# Table name: core_lookup
#
#  lookup_id         :integer          not null, primary key
#  guid              :uuid             not null
#  lookup_type_id    :integer          not null
#  lookup_value      :string(50)       not null
#  lookup_qualifier  :string(50)       not null
#  lookup_qualifier2 :string(50)       not null
#  lookup_qualifier3 :string(50)       not null
#  lookup_qualifier4 :string(50)       not null
#  lookup_qualifier5 :string(50)       not null
#  lookup_qualifier6 :string(50)       not null
#  lookup_qualifier7 :string(50)       not null
#  lookup_qualifier8 :string(2000)     not null
#  lookup_order      :integer          not null
#  active            :boolean          not null
#  system_flag       :boolean          not null
#  foreign_key       :integer
#

class Arena::Lookup < Arena::Base
  self.table_name = :core_lookup
  self.primary_key = :lookup_id
end
