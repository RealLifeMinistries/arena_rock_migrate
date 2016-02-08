# == Schema Information
#
# Table name: core_relationship
#
#  relationship_id      :integer          not null, primary key
#  date_created         :datetime         not null
#  date_modified        :datetime         not null
#  created_by           :varchar(50)      not null
#  modified_by          :varchar(50)      not null
#  relationship_type_id :integer          not null
#  person_id            :integer          not null
#  related_person_id    :integer          not null
#

class Arena::Relationship < Arena::Base
  self.table_name = 'core_relationship'
  self.primary_key = :relationship_id
end
