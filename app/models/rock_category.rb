# == Schema Information
#
# Table name: rock_categories
#
#  Id                        :integer          not null, primary key
#  IsSystem                  :boolean
#  ParentCategoryId          :integer
#  EntityTypeId              :integer
#  EntityTypeQualifierColumn :string
#  EntityTypeQualifierValue  :string
#  Name                      :string
#  IconCssClass              :string
#  Guid                      :uuid
#  Order                     :integer
#  Description               :string
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  ForeignId                 :integer
#  HighlightColor            :string
#

class RockCategory < ActiveRecord::Base
  self.primary_key = :Id

end
