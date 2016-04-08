# == Schema Information
#
# Table name: arena_occurrences
#
#  occurrence_id               :integer          not null, primary key
#  date_created                :datetime
#  date_modified               :datetime
#  created_by                  :string
#  modified_by                 :string
#  occurrence_name             :string
#  occurrence_description      :string
#  occurrence_start_time       :datetime
#  occurrence_end_time         :datetime
#  check_in_start              :datetime
#  check_in_end                :datetime
#  location                    :string
#  location_id                 :integer
#  mission_related             :boolean
#  occurrence_type             :integer
#  location_address_id         :integer
#  membership_required         :integer
#  occurrence_type_template_id :integer
#  area_id                     :integer
#  occurrence_closed           :boolean
#  foreign_key                 :integer
#

class ArenaOccurrence < ArenaBase
  self.primary_key = 'occurrence_id'
  belongs_to :type_record, class_name: "ArenaOccurrenceType", foreign_key: :occurrence_type
  belongs_to :area, class_name: "ArenaArea"
  has_one :small_group_occurrence, class_name: "ArenaOccurrenceAttendanceSmallGroup", foreign_key: :occurrence_id
  has_one :profile_occurrence, class_name: "ArenaOccurrenceAttendanceProfile", foreign_key: :occurrence_id

  POST_FALLS_WEEKEND_WS_LIVE_ONLINE = 821
  ALL_POST_FALLS_WEEKEND_WORSHIP_SERVICES = 1
  RLM_CDA_WEEKEND_WORSHIP = 524
end
