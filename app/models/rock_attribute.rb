# == Schema Information
#
# Table name: rock_attributes
#
#  Id                        :integer          not null, primary key
#  IsSystem                  :boolean
#  FieldTypeId               :integer
#  EntityTypeId              :integer
#  EntityTypeQualifierColumn :string
#  EntityTypeQualifierValue  :string
#  Key                       :string
#  Name                      :string
#  Description               :string
#  Order                     :integer
#  IsGridColumn              :boolean
#  DefaultValue              :string
#  IsMultiValue              :boolean
#  IsRequired                :boolean
#  Guid                      :uuid
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  ForeignId                 :integer
#  IconCssClass              :string
#

class RockAttribute < ActiveRecord::Base
  self.primary_key = :Id

  belongs_to :field_type, class: RockFieldType, primary_key: 'Id', foreign_key: 'FieldTypeId'
  belongs_to :entity_type, class: RockEntityType, primary_key: 'Id', foreign_key: 'EntityTypeId'

  has_one :mapping, as: :rock_record
  has_one :arena_record, through: :mapping
end
