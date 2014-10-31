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

  belongs_to :field_type, class_name: 'RockFieldType', primary_key: 'Id', foreign_key: 'FieldTypeId'
end
