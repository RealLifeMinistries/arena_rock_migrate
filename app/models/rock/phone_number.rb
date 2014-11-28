# == Schema Information
#
# Table name: PhoneNumber
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  PersonId                :integer          not null
#  Number                  :string(20)       not null
#  Extension               :string(20)
#  NumberTypeValueId       :integer
#  IsMessagingEnabled      :boolean          not null
#  IsUnlisted              :boolean          not null
#  Description             :text
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  CountryCode             :string(3)
#  ForeignId               :string(50)
#  NumberFormatted         :string(50)
#

class Rock::PhoneNumber < Rock::Base
  self.table_name = 'PhoneNumber'
  self.primary_key = :Id
end
