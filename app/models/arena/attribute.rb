# == Schema Information
#
# Table name: core_attribute
#
#  attribute_id       :integer          not null, primary key
#  guid               :uuid             not null
#  date_created       :datetime         not null
#  date_modified      :datetime         not null
#  created_by         :varchar(50)      not null
#  modified_by        :varchar(50)      not null
#  attribute_group_id :integer
#  attribute_name     :varchar(50)      not null
#  attribute_type     :integer          not null
#  attribute_order    :integer          not null
#  visible            :boolean          not null
#  required           :boolean          not null
#  type_qualifier     :varchar(100)     not null
#  readonly           :boolean          not null
#  system_flag        :boolean          not null
#

class Arena::Attribute < Arena::Base
  self.table_name = :core_attribute
  self.primary_key = :attribute_id
  belongs_to :attribute_group, class_name: 'Arena::AttributeGroup', primary_key: 'attribute_group_id'
end
