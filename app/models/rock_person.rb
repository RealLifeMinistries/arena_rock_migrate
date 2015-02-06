# == Schema Information
#
# Table name: rock_people
#
#  Id                        :integer          not null, primary key
#  IsSystem                  :boolean
#  RecordTypeValueId         :integer
#  RecordStatusValueId       :integer
#  RecordStatusReasonValueId :integer
#  ConnectionStatusValueId   :integer
#  IsDeceased                :boolean
#  TitleValueId              :integer
#  FirstName                 :string
#  NickName                  :string
#  MiddleName                :string
#  LastName                  :string
#  SuffixValueId             :integer
#  PhotoId                   :integer
#  BirthDay                  :integer
#  BirthMonth                :integer
#  BirthYear                 :integer
#  Gender                    :integer
#  MaritalStatusValueId      :integer
#  AnniversaryDate           :date
#  GraduationDate            :date
#  GivingGroupId             :integer
#  Email                     :string
#  IsEmailActive             :boolean
#  EmailNote                 :string
#  SystemNote                :string
#  ViewedCount               :integer
#  Guid                      :uuid
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  BirthDate                 :date
#  EmailPreference           :integer
#  InactiveReasonNote        :string
#  ForeignId                 :string(1)
#  ReviewReasonValueId       :integer
#  ReviewReasonNote          :string
#

class RockPerson < RockBase
  self.primary_key = :Id
  has_arena_mapping
  belongs_to :record_type, class: RockDefinedValue, foreign_key: 'RecordTypeValueId', primary_key: 'Id'
  belongs_to :record_status, class: RockDefinedValue, foreign_key: 'RecordStatusValueId', primary_key: 'Id'
  belongs_to :record_status_reason, class: RockDefinedValue, foreign_key: 'RecordStatusReasonValueId', primary_key: 'Id'
  belongs_to :connection_status, class: RockDefinedValue, foreign_key: 'ConnectionStatusValueId', primary_key: 'Id'
  belongs_to :review_reason, class: RockDefinedValue, foreign_key: 'ReviewReasonValueId', primary_key: 'Id'
  belongs_to :title, class: RockDefinedValue, foreign_key: 'TitleValueId', primary_key: 'Id'
  belongs_to :suffix, class: RockDefinedValue, foreign_key: 'SuffixValueId', primary_key: 'Id'
  belongs_to :marital_status, class: RockDefinedValue, foreign_key: 'MaritalStatusValueId', primary_key: 'Id'
  belongs_to :gender, class: RockGender, foreign_key: 'Gender'


  has_many :attribute_values, class: RockAttributeValue, foreign_key: 'EntityId'
  has_many :phone_numbers, class: RockPhoneNumber, foreign_key: 'PersonId'

  has_one :person_alias, class: RockPersonAlias, foreign_key: 'PersonId'

  def make_alias
    self.person_alias ||= RockPersonAlias.create({
      PersonId: self.Id,
      AliasPersonId: self.Id,
      AliasPersonGuid: self.Guid,
      Guid: SecureRandom.uuid
    })
  end

end
