# == Schema Information
#
# Table name: core_attribute_group
#
#  attribute_group_id :integer          not null, primary key
#  guid               :uuid             not null
#  date_created       :datetime         not null
#  date_modified      :datetime         not null
#  created_by         :varchar(50)      not null
#  modified_by        :varchar(50)      not null
#  organization_id    :integer          not null
#  system_flag        :boolean          not null
#  group_name         :varchar(50)      not null
#  group_order        :integer          not null
#  display_location   :integer          not null
#

class Arena::AttributeGroup < Arena::Base
  self.table_name = :core_attribute_group
  self.primary_key = :attribute_group_id
end
