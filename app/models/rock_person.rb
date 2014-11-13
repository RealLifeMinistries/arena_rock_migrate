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

class RockPerson < ActiveRecord::Base
  self.primary_key = :Id
end
