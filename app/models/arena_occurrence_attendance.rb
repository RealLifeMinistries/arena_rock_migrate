# == Schema Information
#
# Table name: arena_occurrence_attendance
#
#  occurrence_attendance_id :integer          not null, primary key
#  occurrence_id            :integer
#  person_id                :integer
#  security_code            :string
#  attended                 :boolean
#  check_in_time            :datetime
#  check_out_time           :datetime
#  notes                    :string
#  pager                    :string
#  session_id               :integer
#  type                     :integer
#

class ArenaOccurrenceAttendance < ArenaBase
  self.primary_key = 'occurrence_attendance_id'

  belongs_to :occurrence, class: ArenaOccurrence
  belongs_to :person, class: ArenaPerson
  has_and_belongs_to_many :profiles, class_name: "ArenaProfile", 
    join_table: 'arena_occurrence_attendances_profiles', foreign_key: :occurrence_id,
    association_foreign_key: :profile_id
  has_and_belongs_to_many :small_groups, class_name: "ArenaSmallGroup", 
    join_table: 'arena_occurrence_attendances_small_groups', foreign_key: :occurrence_id,
    association_foreign_key: :group_id


  self.table_name = 'arena_occurrence_attendance'

  has_rock_mapping

  def self.inheritance_column
    nil
  end
  
  def sync_to_rock!(only_new = true)
    occurrence.type_record.sync_to_rock!

    map = self.mapping || build_mapping
    rock = map.rock_record ||= RockAttendance.new

    return if only_new && rock.persisted? && map.persisted?

    rock.ScheduleId = occurrence.type_record.mapped_id
    rock.PersonAliasId = person.mapped_record.person_alias.Id
    rock.StartDateTime = check_in_time

    if check_out_time
      rock.EndDateTime = check_out_time 
    else
      rock.EndDateTime = check_in_time
    end

    rock.DidAttend = attended?
    rock.Note = notes
    rock.Guid ||= SecureRandom.uuid
    if !rock.GroupId? && g = group
      rock.GroupId = g.mapped_id
    end

    rock.save!
    map.save!
  end

  def check_out_time
    nil_if_1900 read_attribute(:check_out_time)
  end

  def group
    # weekend service/normal attendance
    if occurrence.occurrence_type == 1
      return RockGroup.find(RockAttendance::WEEKEND_WORSHIP_SERVICE_GROUP)
    end
    
    if profile = profiles.first
      return profile 
    elsif small_group = small_groups.first
      return small_group
    end
    nil
  end
  
end
