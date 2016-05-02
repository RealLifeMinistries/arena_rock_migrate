# == Schema Information
#
# Table name: NoteType
#
#  Id                        :integer          not null, primary key
#  IsSystem                  :boolean          not null
#  EntityTypeId              :integer          not null
#  Name                      :string(100)      not null
#  EntityTypeQualifierColumn :string(50)
#  EntityTypeQualifierValue  :string(200)
#  Guid                      :uuid             not null
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  ForeignKey                :string(100)
#  UserSelectable            :boolean          default(FALSE), not null
#  CssClass                  :string(100)
#  IconCssClass              :string(100)
#  Order                     :integer          default(0), not null
#  ForeignGuid               :uuid
#  ForeignId                 :integer
#

class RockNoteType < RockBase
  self.primary_key = :Id
  self.table_name = "NoteType"
  
  has_many :notes, class_name: "RockNote", foreign_key: 'NoteTypeId'
end
