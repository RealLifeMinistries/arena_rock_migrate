# == Schema Information
#
# Table name: arena_profile_types
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class ArenaProfileType < ActiveRecord::Base

  has_rock_mapping

  PARTICIPANT = 1
  SERVING = 2
  CLASSES_EVENTS = 4

  def default_rock_parent_group_id
    case id
    when PARTICIPANT
      RockGroup::PARTICIPANT_MINISTRY
    when SERVING
      RockGroup::SERVING_MINISTRY
    when CLASSES_EVENTS
      RockGroup::EVENTS_CLASSES
    else
      nil
    end
  end
end
