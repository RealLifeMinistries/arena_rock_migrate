# == Schema Information
#
# Table name: GroupTypeRole
#
#  Id                               :integer          not null, primary key
#  IsSystem                         :boolean          not null
#  GroupTypeId                      :integer          not null
#  Name                             :string(100)      not null
#  Description                      :text(2147483647)
#  Order                            :integer          not null
#  MaxCount                         :integer
#  MinCount                         :integer
#  IsLeader                         :boolean          not null
#  Guid                             :uuid             not null
#  CreatedDateTime                  :datetime
#  ModifiedDateTime                 :datetime
#  CreatedByPersonAliasId           :integer
#  ModifiedByPersonAliasId          :integer
#  ForeignKey                       :string(100)
#  CanView                          :boolean          default(FALSE), not null
#  CanEdit                          :boolean          default(FALSE), not null
#  ReceiveRequirementsNotifications :boolean          default(FALSE), not null
#  ForeignGuid                      :uuid
#  ForeignId                        :integer
#

class Rock::GroupTypeRole < Rock::Base
  self.table_name = 'GroupTypeRole'
  self.primary_key = :Id
end
