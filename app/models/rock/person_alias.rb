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

class Rock::PersonAlias < Rock::Base
  self.primary_key = :Id
  self.table_name = 'PersonAlias'
end
