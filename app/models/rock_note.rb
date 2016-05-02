# == Schema Information
#
# Table name: Note
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  NoteTypeId              :integer          not null
#  EntityId                :integer
#  Caption                 :string(200)
#  IsAlert                 :boolean
#  Text                    :text
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignKey              :string(100)
#  ForeignGuid             :uuid
#  ForeignId               :integer
#  IsPrivateNote           :boolean          default(FALSE), not null
#

class RockNote < RockBase
  self.primary_key = :Id
  self.table_name = "Note"
  
  belongs_to :entity, class_name: "RockPerson", foreign_key: 'EntityId'
  belongs_to :note_type, class_name: "RockNoteType", foreign_key: 'NoteTypeId'
end
