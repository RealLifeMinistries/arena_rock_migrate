# == Schema Information
#
# Table name: PersonAlias
#
#  Id              :integer          not null, primary key
#  Name            :string(200)
#  PersonId        :integer          not null
#  AliasPersonId   :integer          not null
#  AliasPersonGuid :uuid             not null
#  Guid            :uuid             not null
#  ForeignId       :string(50)
#

class RockPersonAlias < RockBase
  self.primary_key = :Id
  self.table_name = 'PersonAlias'
  belongs_to :person, class: RockPerson, foreign_key: 'PersonId'
  belongs_to :alias_person, class: RockPerson, foreign_key: 'AliasPersonId'
end
