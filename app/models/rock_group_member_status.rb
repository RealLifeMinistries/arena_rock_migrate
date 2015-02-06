# == Schema Information
#
# Table name: rock_group_member_statuses
#
#  id   :integer          not null, primary key
#  name :string
#

class RockGroupMemberStatus < RockBase
  INACTIVE = 0
  ACTIVE = 1  
  PENDING = 2
end
