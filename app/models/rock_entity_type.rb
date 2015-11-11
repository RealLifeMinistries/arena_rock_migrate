# == Schema Information
#
# Table name: EntityType
#
#  Id                     :integer          not null, primary key
#  Name                   :string(100)
#  AssemblyName           :string(260)
#  FriendlyName           :string(100)
#  IsEntity               :boolean          not null
#  IsSecured              :boolean          not null
#  IsCommon               :boolean          not null
#  Guid                   :uuid             not null
#  ForeignId              :string(50)
#  SingleValueFieldTypeId :integer
#  MultiValueFieldTypeId  :integer
#

class RockEntityType <  RockBase
  self.primary_key = :Id
  self.table_name = 'EntityType'
  belongs_to :single_value_field_type, class_name: "RockFieldType", foreign_key: :SingleValueFieldTypeId, primary_key: :Id
  belongs_to :multi_value_field_type, class_name: "RockFieldType", foreign_key: :SingleValueFieldTypeId, primary_key: :Id

  PERSON = 15
  ATTRIBUTE = 49
end
