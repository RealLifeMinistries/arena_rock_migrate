# == Schema Information
#
# Table name: EntityType
#
#  Id                     :integer          not null, primary key
#  Name                   :string(100)
#  AssemblyName           :string(260)
#  FriendlyName           :string(100)
#  IsEntity               :boolean          not null
#  IsSecured              :boolean          not null
#  IsCommon               :boolean          not null
#  Guid                   :uuid             not null
#  ForeignId              :string(50)
#  SingleValueFieldTypeId :integer
#  MultiValueFieldTypeId  :integer
#

class Rock::EntityType < Rock::Base
  self.primary_key = :Id
  self.table_name = 'EntityType'
end
