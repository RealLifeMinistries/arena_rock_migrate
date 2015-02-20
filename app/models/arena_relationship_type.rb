# == Schema Information
#
# Table name: arena_relationship_types
#
#  relationship_type_id         :integer          not null, primary key
#  date_created                 :datetime
#  date_modified                :datetime
#  created_by                   :string
#  modified_by                  :string
#  organization_id              :integer
#  relationship                 :string
#  relationship_order           :integer
#  inverse_relationship_type_id :integer
#  peer_relationship_strength   :integer
#

class ArenaRelationshipType < ArenaBase
  self.primary_key = :relationship_type_id
end
