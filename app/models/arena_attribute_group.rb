# == Schema Information
#
# Table name: arena_attribute_groups
#
#  attribute_group_id :integer          not null, primary key
#  guid               :uuid
#  date_created       :datetime
#  date_modified      :datetime
#  created_by         :string
#  modified_by        :string
#  organization_id    :integer
#  system_flag        :boolean
#  group_name         :string
#  group_order        :integer
#  display_location   :integer
#

class ArenaAttributeGroup < ActiveRecord::Base
  self.primary_key = 'attribute_group_id'
end
