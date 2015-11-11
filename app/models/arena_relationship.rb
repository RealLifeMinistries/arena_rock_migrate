# == Schema Information
#
# Table name: arena_relationships
#
#  relationship_id      :integer          not null, primary key
#  date_created         :datetime
#  date_modified        :datetime
#  created_by           :string
#  modified_by          :string
#  relationship_type_id :integer
#  person_id            :integer
#  related_person_id    :integer
#

class ArenaRelationship < ArenaBase
  self.primary_key = :relationship_id

  belongs_to :relationship_type, class_name: "ArenaRelationshipType"
  belongs_to :person, class_name: "ArenaPerson"
  belongs_to :related_person, class_name: "ArenaPerson"
  belongs_to :inverse_type, class_name: "ArenaRelationshipType"
end
