class ArenaNotes < ArenaBase
  self.table_name = 'arena_notes'
  self.primary_key = 'person_history_id'
  
  belongs_to :person, foreign_key: "person_id", class_name: "ArenaPerson", primary_key: "person_id" 
  
  def sync_to_rock!
    map = mapping || build_mapping
    
    rock_note ||= RockNote.find_or_initialize_by({
      NoteTypeId: 21,
      DateModified: date_modified
    })
    
    rock_note.EntityId = person.mapped_record.Id
    rock_note.Text = "Entered by: #{modified_by}<br>#{history}"
    rock_note.save!
    map.save!
    end
end