# == Schema Information
#
# Table name: Person
#
#  Id                        :integer          not null, primary key
#  IsSystem                  :boolean          not null
#  RecordTypeValueId         :integer
#  RecordStatusValueId       :integer
#  RecordStatusReasonValueId :integer
#  ConnectionStatusValueId   :integer
#  IsDeceased                :boolean
#  TitleValueId              :integer
#  FirstName                 :string(50)
#  NickName                  :string(50)
#  MiddleName                :string(50)
#  LastName                  :string(50)
#  SuffixValueId             :integer
#  PhotoId                   :integer
#  BirthDay                  :integer
#  BirthMonth                :integer
#  BirthYear                 :integer
#  Gender                    :integer          not null
#  MaritalStatusValueId      :integer
#  AnniversaryDate           :date
#  GivingGroupId             :integer
#  Email                     :string(75)
#  IsEmailActive             :boolean
#  EmailNote                 :string(250)
#  SystemNote                :string(1000)
#  ViewedCount               :integer
#  Guid                      :uuid             not null
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  EmailPreference           :integer          default(0), not null
#  InactiveReasonNote        :string(1000)
#  ForeignId                 :string(50)
#  ReviewReasonValueId       :integer
#  ReviewReasonNote          :string(1000)
#  GraduationYear            :integer
#  BirthDate                 :date
#

class RockPerson < RockBase
  self.primary_key = :Id
  self.table_name = 'Person'
  has_arena_mapping
  belongs_to :record_type, class_name: "RockDefinedValue", foreign_key: 'RecordTypeValueId', primary_key: 'Id'
  belongs_to :record_status, class_name: "RockDefinedValue", foreign_key: 'RecordStatusValueId', primary_key: 'Id'
  belongs_to :record_status_reason, class_name: "RockDefinedValue", foreign_key: 'RecordStatusReasonValueId', primary_key: 'Id'
  belongs_to :connection_status, class_name: "RockDefinedValue", foreign_key: 'ConnectionStatusValueId', primary_key: 'Id'
  belongs_to :review_reason, class_name: "RockDefinedValue", foreign_key: 'ReviewReasonValueId', primary_key: 'Id'
  belongs_to :title, class_name: "RockDefinedValue", foreign_key: 'TitleValueId', primary_key: 'Id'
  belongs_to :suffix, class_name: "RockDefinedValue", foreign_key: 'SuffixValueId', primary_key: 'Id'
  belongs_to :marital_status, class_name: "RockDefinedValue", foreign_key: 'MaritalStatusValueId', primary_key: 'Id'
  belongs_to :gender, class_name: "RockGender", foreign_key: 'Gender'


  has_many :attribute_values, class_name: "RockAttributeValue", foreign_key: 'EntityId'
  has_many :phone_numbers, class_name: "RockPhoneNumber", foreign_key: 'PersonId'

  has_one :person_alias, class_name: "RockPersonAlias", foreign_key: 'PersonId'

  def make_alias
    self.person_alias ||= RockPersonAlias.create({
      PersonId: self.Id,
      AliasPersonId: self.Id,
      AliasPersonGuid: self.Guid,
      Guid: SecureRandom.uuid
    })
  end

end
