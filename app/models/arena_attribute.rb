# == Schema Information
#
# Table name: arena_attributes
#
#  attribute_id       :integer          not null, primary key
#  guid               :uuid
#  date_created       :datetime
#  date_modified      :datetime
#  created_by         :string
#  modified_by        :string
#  attribute_group_id :integer
#  attribute_name     :string
#  attribute_type     :integer
#  attribute_order    :integer
#  visible            :boolean
#  required           :boolean
#  type_qualifier     :string
#  readonly           :boolean
#  system_flag        :boolean
#

class ArenaAttribute < ActiveRecord::Base
  self.primary_key = 'attribute_id'
end
