# == Schema Information
#
# Table name: core_relationship_type
#
#  relationship_type_id         :integer          not null, primary key
#  date_created                 :datetime         not null
#  date_modified                :datetime         not null
#  created_by                   :string(50)       not null
#  modified_by                  :string(50)       not null
#  organization_id              :integer          not null
#  relationship                 :string(50)       not null
#  relationship_order           :integer          not null
#  inverse_relationship_type_id :integer
#  peer_relationship_strength   :integer          not null
#

class Arena::RelationshipType < Arena::Base
  self.primary_key = 'relationship_type_id'
  self.table_name = 'core_relationship_type'
end
