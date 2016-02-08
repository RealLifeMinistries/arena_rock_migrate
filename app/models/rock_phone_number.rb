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
#  Description             :text(2147483647)
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  CountryCode             :string(3)
#  ForeignKey              :string(100)
#  NumberFormatted         :string(50)
#  ForeignGuid             :uuid
#  ForeignId               :integer
#

class RockPhoneNumber < RockBase
  self.primary_key = :Id
  self.table_name = 'PhoneNumber'
  has_arena_mapping 
  belongs_to :person, class_name: "RockPerson", foreign_key: 'PersonId'

  belongs_to :type, class_name: "RockDefinedValue", foreign_key: 'NumberTypeValueId'

end
