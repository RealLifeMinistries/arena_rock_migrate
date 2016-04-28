# == Schema Information
#
# Table name: core_relationship_type
#
#  relationship_type_id         :integer          not null, primary key
#  date_created                 :datetime         not null
#  date_modified                :datetime         not null
#  created_by                   :varchar(50)      default(""), not null
#  modified_by                  :varchar(50)      default(""), not null
#  organization_id              :integer          not null
#  relationship                 :varchar(50)      default(""), not null
#  relationship_order           :integer          default(0), not null
#  inverse_relationship_type_id :integer
#  peer_relationship_strength   :integer          default(0), not null
#

class Arena::RelationshipType < Arena::Base
  self.primary_key = 'relationship_type_id'
  self.table_name = 'core_relationship_type'
end
