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
#  GraduationDate            :date
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
#  BirthDate                 :date
#  EmailPreference           :integer          default(0), not null
#  InactiveReasonNote        :string(1000)
#  ForeignId                 :string(50)
#  ReviewReasonValueId       :integer
#  ReviewReasonNote          :string(1000)
#

class Rock::Person < Rock::Base
  self.primary_key = :Id
  self.table_name = 'Person'

  def BirthDate=d
    # computed column!
  end
end
