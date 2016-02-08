# == Schema Information
#
# Table name: Category
#
#  Id                        :integer          not null, primary key
#  IsSystem                  :boolean          not null
#  ParentCategoryId          :integer
#  EntityTypeId              :integer          not null
#  EntityTypeQualifierColumn :string(50)
#  EntityTypeQualifierValue  :string(200)
#  Name                      :string(100)      not null
#  IconCssClass              :string(100)
#  Guid                      :uuid             not null
#  Order                     :integer          not null
#  Description               :text(2147483647)
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  ForeignKey                :string(100)
#  HighlightColor            :string(50)
#  ForeignGuid               :uuid
#  ForeignId                 :integer
#

class Rock::Category < Rock::Base
  self.primary_key = :Id
  self.table_name = 'Category'
end
