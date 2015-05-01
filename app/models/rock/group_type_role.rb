# == Schema Information
#
# Table name: GroupTypeRole
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  GroupTypeId             :integer          not null
#  Name                    :string(100)      not null
#  Description             :text
#  Order                   :integer          not null
#  MaxCount                :integer
#  MinCount                :integer
#  IsLeader                :boolean          not null
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string(50)
#  CanView                 :boolean          default(FALSE), not null
#  CanEdit                 :boolean          default(FALSE), not null
#

class Rock::GroupTypeRole < Rock::Base
  self.table_name = 'GroupTypeRole'
  self.primary_key = :Id
end
