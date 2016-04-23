# == Schema Information
#
# Table name: arena_profile_types
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class ArenaProfileType < ArenaBase

  has_rock_mapping

  PARTICIPANT = 1
  SERVING = 2
  CLASSES_EVENTS = 4

end
