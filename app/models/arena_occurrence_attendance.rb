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

  belongs_to :occurrence, class_name: "ArenaOccurrence"
  belongs_to :person, class_name: "ArenaPerson"
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
    @map = self.mapping || build_mapping
    @rock = @map.rock_record ||= RockAttendance.new

    return if only_new && @rock.persisted? && @map.persisted?

    @rock.PersonAliasId ||= person.mapped_record.person_alias.Id
    @rock.StartDateTime ||= check_in_time

    if check_out_time
      @rock.EndDateTime ||= check_out_time
    else
      @rock.EndDateTime ||= check_in_time
    end

    @rock.DidAttend ||= attended?
    @rock.Note ||= notes
    @rock.Guid ||= SecureRandom.uuid
    #if !rock.GroupId? && g = group_id
    if g = group_id
      @rock.GroupId ||= g
    end

    if occurrence.occurrence_type == ArenaOccurrence::ALL_POST_FALLS_WEEKEND_WORSHIP_SERVICES ||  occurrence.occurrence_type == ArenaOccurrence::POST_FALLS_WEEKEND_WS_LIVE_ONLINE
      @rock.CampusId ||= RockCampus::PF
    elsif occurrence.occurrence_type == ArenaOccurrence::RLM_CDA_WEEKEND_WORSHIP
      @rock.CampusId ||= RockCampus::CDA
    end

    # add member to attendance group
    if ([RockAttendance::CDA_WEEKEND_WORSHIP_SERVICE_GROUP,RockAttendance::WEEKEND_WORSHIP_SERVICE_GROUP].include? @group_id)
      add_group_member
    end
    @rock.save!
    @map.save!
  end

  def check_out_time
    nil_if_1900 read_attribute(:check_out_time)
  end

  def group_id
    return @group_id if @group_id
    if occurrence.small_group_occurrence
      return @group_id = occurrence.small_group_occurrence.small_group.mapped_id
    elsif occurrence.profile_occurrence
      return @group_id = occurrence.profile_occurrence.profile.mapped_id
    elsif occurrence.type_record.sync_with_profile?
      profile = ArenaProfile.find(occurrence.type_record.sync_with_profile)
      return @group_id = profile.mapped_id
    elsif occurrence.type_record.sync_with_group?
      group = ArenaSmallGroup.find(occurrence.type_record.sync_with_group)
      return @group_id = group.mapped_id
    elsif occurrence.occurrence_type == ArenaOccurrence::RLM_CDA_WEEKEND_WORSHIP
      return @group_id = RockAttendance::CDA_WEEKEND_WORSHIP_SERVICE_GROUP
    elsif occurrence.occurrence_type == ArenaOccurrence::ALL_POST_FALLS_WEEKEND_WORSHIP_SERVICES || occurrence.occurrence_type == ArenaOccurrence::POST_FALLS_WEEKEND_WS_LIVE_ONLINE
      return @group_id = RockAttendance::WEEKEND_WORSHIP_SERVICE_GROUP
    end
  end
  # this method creates a group member of a given group
  def add_group_member
    @group_member = RockGroupMember.find_or_initialize_by({
        GroupId: @group_id,
        PersonId: person.mapped_record.person_alias.PersonId
                                                          })
    @group_member.IsSystem = false
    @group_member.GroupRoleId = 266 # member for worship services
    @group_member.GroupMemberStatus = 1 #
    @group_member.Guid = SecureRandom.uuid
    @group_member.CreatedDateTime = Time.new
    @group_member.Note = 'Imported From Arena'

    @group_member.save!
  end
end
