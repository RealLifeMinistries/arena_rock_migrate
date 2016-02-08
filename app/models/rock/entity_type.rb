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
#  ForeignKey             :string(100)
#  SingleValueFieldTypeId :integer
#  MultiValueFieldTypeId  :integer
#  ForeignGuid            :uuid
#  ForeignId              :integer
#

class Rock::EntityType < Rock::Base
  self.primary_key = :Id
  self.table_name = 'EntityType'
end
