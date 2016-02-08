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
#  ForeignKey      :string(100)
#  ForeignGuid     :uuid
#  ForeignId       :integer
#

class RockPersonAlias < RockBase
  self.primary_key = :Id
  self.table_name = 'PersonAlias'
  belongs_to :person, class_name: "RockPerson", foreign_key: 'PersonId'
  belongs_to :alias_person, class_name: "RockPerson", foreign_key: 'AliasPersonId'
end
