# == Schema Information
#
# Table name: Group
#
#  Id                              :integer          not null, primary key
#  IsSystem                        :boolean          not null
#  ParentGroupId                   :integer
#  GroupTypeId                     :integer          not null
#  CampusId                        :integer
#  Name                            :string(100)      not null
#  Description                     :text(2147483647)
#  IsSecurityRole                  :boolean          not null
#  IsActive                        :boolean          not null
#  Order                           :integer          not null
#  Guid                            :uuid             not null
#  CreatedDateTime                 :datetime
#  ModifiedDateTime                :datetime
#  CreatedByPersonAliasId          :integer
#  ModifiedByPersonAliasId         :integer
#  ForeignKey                      :string(100)
#  AllowGuests                     :boolean
#  ScheduleId                      :integer
#  WelcomeSystemEmailId            :integer
#  ExitSystemEmailId               :integer
#  SyncDataViewId                  :integer
#  AddUserAccountsDuringSync       :boolean
#  MustMeetRequirementsToAddMember :boolean
#  IsPublic                        :boolean          default(TRUE), not null
#  ForeignGuid                     :uuid
#  ForeignId                       :integer
#

class Rock::Group < Rock::Base
  self.table_name = 'Group'
  self.primary_key = :Id
end
