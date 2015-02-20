# == Schema Information
#
# Table name: arena_small_group_occurrences
#
#  group_id      :integer          not null, primary key
#  occurrence_id :integer          not null, primary key
#

class ArenaSmallGroupOccurrence < ArenaBase
  self.primary_key = :group_id, :occurrence_id
  belongs_to :group, class: ArenaSmallGroup
  belongs_to :occurrence, class: ArenaOccurrence
end
