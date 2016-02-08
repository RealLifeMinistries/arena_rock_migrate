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
#  Key                       :string(1000)     not null
#  Name                      :string(1000)     not null
#  Description               :text(2147483647)
#  Order                     :integer          not null
#  IsGridColumn              :boolean          not null
#  DefaultValue              :text(2147483647)
#  IsMultiValue              :boolean          not null
#  IsRequired                :boolean          not null
#  Guid                      :uuid             not null
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  ForeignKey                :string(100)
#  IconCssClass              :string(100)
#  AllowSearch               :boolean          default(FALSE), not null
#  ForeignGuid               :uuid
#  ForeignId                 :integer
#

class Rock::Attribute < Rock::Base
  self.primary_key = :Id
  self.table_name = 'Attribute'

end
