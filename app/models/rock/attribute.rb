# == Schema Information
#
# Table name: Attribute
#
#  Id                        :integer          not null, primary key
#  IsSystem                  :boolean          not null
#  FieldTypeId               :integer          not null
#  EntityTypeId              :integer
#  EntityTypeQualifierColumn :string(50)
#  EntityTypeQualifierValue  :string(200)
#  Key                       :string(50)       not null
#  Name                      :string(100)      not null
#  Description               :text
#  Order                     :integer          not null
#  IsGridColumn              :boolean          not null
#  DefaultValue              :text
#  IsMultiValue              :boolean          not null
#  IsRequired                :boolean          not null
#  Guid                      :uuid             not null
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  ForeignId                 :string(50)
#  IconCssClass              :text
#

class Rock::Attribute < Rock::Base
  self.primary_key = :Id
  self.table_name = 'Attribute'

end
