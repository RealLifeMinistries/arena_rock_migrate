# == Schema Information
#
# Table name: PrayerRequest
#
#  Id                       :integer          not null, primary key
#  FirstName                :string(50)       not null
#  LastName                 :string(50)
#  Email                    :string(254)
#  CategoryId               :integer
#  Text                     :text(2147483647) not null
#  Answer                   :text(2147483647)
#  EnteredDateTime          :datetime         not null
#  ExpirationDate           :date
#  GroupId                  :integer
#  AllowComments            :boolean
#  IsUrgent                 :boolean
#  IsPublic                 :boolean
#  IsActive                 :boolean
#  IsApproved               :boolean
#  FlagCount                :integer
#  PrayerCount              :integer
#  ApprovedOnDateTime       :datetime
#  Guid                     :uuid             not null
#  CreatedDateTime          :datetime
#  ModifiedDateTime         :datetime
#  CreatedByPersonAliasId   :integer
#  ModifiedByPersonAliasId  :integer
#  ForeignKey               :string(100)
#  RequestedByPersonAliasId :integer
#  ApprovedByPersonAliasId  :integer
#  ForeignGuid              :uuid
#  ForeignId                :integer
#

class RockPrayerRequest < RockBase
  self.primary_key = :Id
  self.table_name = "PrayerRequest"

  belongs_to :category, class_name: "RockCategory", foreign_key: 'CategoryId'
  belongs_to :group, class_name: "RockGroup", foreign_key: 'GroupId'
  belongs_to :person, class_name: "RockPersonAlias", foreign_key: 'RequestedByPersonAliasId'
end
