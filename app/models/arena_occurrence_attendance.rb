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
  self.table_name = 'arena_occurrence_attendance'

  belongs_to :occurrence, class: ArenaOccurrence
  belongs_to :person, class: ArenaPerson

  has_rock_mapping

  def self.inheritance_column
    nil
  end
  
  def sync_to_rock!
    occurrence.type_record.sync_to_rock!

    map = self.mapping || build_mapping
    rock = map.rock_record ||= RockAttendance.new

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

    if occurrence.type_record.group
      rock.GroupId = occurrence.type_record.group.mapped_id
    end

    rock.save!
    map.save!
  end

  def check_out_time
    nil_if_1900 read_attribute(:check_out_time)
  end
  
end
