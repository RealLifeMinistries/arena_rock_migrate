# == Schema Information
#
# Table name: rock_person_aliases
#
#  Id              :integer          not null, primary key
#  Name            :string
#  PersonId        :integer
#  AliasPersonId   :integer
#  AliasPersonGuid :uuid
#  Guid            :uuid
#  ForeignId       :string
#

class RockPersonAlias < ActiveRecord::Base
  self.primary_key = :Id
  belongs_to :person, class: RockPerson, foreign_key: 'PersonId'
  belongs_to :alias_person, class: RockPerson, foreign_key: 'AliasPersonId'
end
