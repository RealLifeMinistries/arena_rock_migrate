# == Schema Information
#
# Table name: rock_phone_numbers
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  PersonId                :integer          not null
#  Number                  :string           not null
#  Extension               :string
#  NumberTypeValueId       :integer
#  IsMessagingEnabled      :boolean          not null
#  IsUnlisted              :boolean          not null
#  Description             :string
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  CountryCode             :string
#  ForeignId               :string
#  NumberFormatted         :string
#

class RockPhoneNumber < RockBase
  self.primary_key = :Id
  has_arena_mapping 
  belongs_to :person, class: RockPerson, foreign_key: 'PersonId'

  belongs_to :type, class: RockDefinedValue, foreign_key: 'NumberTypeValueId'

end
