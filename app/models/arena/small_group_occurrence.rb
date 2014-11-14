# == Schema Information
#
# Table name: smgp_group_occurrence
#
#  group_id      :integer          not null, primary key
#  occurrence_id :integer          not null, primary key
#

class Arena::SmallGroupOccurrence < Arena::Base
  self.table_name = 'smgp_group_occurrence'
  self.primary_key = :group_id,:occurrence_id
end
