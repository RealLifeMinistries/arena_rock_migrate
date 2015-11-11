# == Schema Information
#
# Table name: arena_small_group_occurrences
#
#  group_id      :integer          not null, primary key
#  occurrence_id :integer          not null, primary key
#

class ArenaSmallGroupOccurrence < ArenaBase
  self.primary_key = :group_id, :occurrence_id
  belongs_to :group, class_name: "ArenaSmallGroup"
  belongs_to :occurrence, class_name: "ArenaOccurrence"
end
