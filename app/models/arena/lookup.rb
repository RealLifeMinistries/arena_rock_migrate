# == Schema Information
#
# Table name: core_lookup
#
#  lookup_id         :integer          not null, primary key
#  guid              :uuid             not null
#  lookup_type_id    :integer          not null
#  lookup_value      :varchar(50)      not null
#  lookup_qualifier  :varchar(50)      default(""), not null
#  lookup_qualifier2 :varchar(50)      default(""), not null
#  lookup_qualifier3 :varchar(50)      default(""), not null
#  lookup_qualifier4 :varchar(50)      default(""), not null
#  lookup_qualifier5 :varchar(50)      default(""), not null
#  lookup_qualifier6 :varchar(50)      default(""), not null
#  lookup_qualifier7 :varchar(50)      default(""), not null
#  lookup_qualifier8 :varchar(2000)    default(""), not null
#  lookup_order      :integer          default(0), not null
#  active            :boolean          default(TRUE), not null
#  system_flag       :boolean          default(FALSE), not null
#  foreign_key       :integer
#

class Arena::Lookup < Arena::Base
  self.table_name = :core_lookup
  self.primary_key = :lookup_id
end
