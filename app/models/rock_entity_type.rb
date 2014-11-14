# == Schema Information
#
# Table name: rock_entity_types
#
#  Id                     :integer          not null, primary key
#  Name                   :string
#  AssemblyName           :string
#  FriendlyName           :string
#  IsEntity               :boolean
#  IsSecured              :boolean
#  IsCommon               :boolean
#  Guid                   :uuid
#  ForeignId              :integer
#  SingleValueFieldTypeId :integer
#  MultiValueFieldTypeId  :integer
#

class RockEntityType <  ActiveRecord::Base
  self.primary_key = :Id
  belongs_to :single_value_field_type, class: RockFieldType, foreign_key: :SingleValueFieldTypeId, primary_key: :Id
  belongs_to :multi_value_field_type, class: RockFieldType, foreign_key: :SingleValueFieldTypeId, primary_key: :Id
end
