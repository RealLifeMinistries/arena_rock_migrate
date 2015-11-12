# == Schema Information
#
# Table name: arena_people
#
#  person_id               :integer          not null, primary key
#  guid                    :uuid
#  date_created            :datetime
#  date_modified           :datetime
#  date_last_verified      :datetime
#  created_by              :string
#  modified_by             :string
#  title_luid              :integer
#  nick_name               :string
#  first_name              :string
#  middle_name             :string
#  last_name               :string
#  suffix_luid             :integer
#  birth_date              :datetime
#  gender                  :integer
#  postal_code             :string
#  Notes                   :string
#  marital_status          :integer
#  anniversary_date        :datetime
#  record_status           :integer
#  medical_information     :string
#  blob_id                 :integer
#  inactive_reason_luid    :integer
#  foreign_key             :integer
#  foreign_key2            :integer
#  organization_id         :integer
#  active_meter            :integer
#  last_attended           :datetime
#  contribute_individually :boolean
#  giving_unit_id          :string
#  graduation_date         :datetime
#  social_security         :binary
#  print_statement         :boolean
#  envelope_number         :integer
#  include_on_envelope     :boolean
#  staff_member            :boolean
#  campus_id               :integer
#  business                :boolean
#  member_status           :integer
#

# NOTES
# campus_id is not used
class ArenaPerson < ArenaBase
  self.table_name = 'arena_people'
  self.primary_key = 'person_id'
  has_rock_mapping

  belongs_to :member_status_record, foreign_key: :member_status, class_name: "ArenaLookup"
  belongs_to :marital_status_record, foreign_key: :marital_status, class_name: "ArenaLookup"
  belongs_to :gender_record, foreign_key: :gender, class_name: "ArenaGender"
  belongs_to :inactive_reason, foreign_key: :inactive_reason_luid, class_name: "ArenaLookup"
  belongs_to :title, foreign_key: :title_luid, class_name: "ArenaLookup"
  belongs_to :suffix, foreign_key: :suffix_luid, class_name: "ArenaLookup"
  belongs_to :record_status_record, foreign_key: :record_status, class_name: "ArenaRecordStatus"

  has_many :relationships, class_name: "ArenaRelationship", foreign_key: :person_id
  has_many :family_memberships, foreign_key: :person_id, class_name: "ArenaFamilyMember"
  has_many :families, through: :family_memberships, foreign_key: :family_id, class_name: "ArenaFamily"
  has_many :locations, class_name: "ArenaPersonAddress", foreign_key: :person_id
  has_many :addresses, through: :locations, class_name: "ArenaAddress"
  has_many :phones, class_name: "ArenaPersonPhone", foreign_key: :person_id
  has_many :emails, class_name: "ArenaPersonEmail", foreign_key: :person_id
  has_many :profile_memberships, class_name: "ArenaProfileMember", foreign_key: :person_id
  has_many :profiles, through: :profile_memberships, class_name: "ArenaProfile"
  has_many :attribute_values, class_name: "ArenaPersonAttribute", foreign_key: :person_id


  def sync_to_rock!
    map = mapping || build_mapping
    rock = map.rock_record ||= RockPerson.new

    ###############
    # Rock RecordType doesn't have a concept in Arena
    # Rock Person Defined Value is: 1
    rock.RecordTypeValueId = 1
    rock.IsSystem ||= false

    if record_status
      rock.RecordStatusValueId = record_status_record.mapped_id
    end

    if inactive_reason
      rock.RecordStatusReasonValueId = inactive_reason.mapped_id
    end

    if member_status
      rock.ConnectionStatusValueId = member_status_record.mapped_id
    end

    rock.IsDeceased = is_deceased?

    if title
      rock.TitleValueId = title.mapped_id
    end

    rock.NickName = nick_name
    rock.FirstName = first_name
    rock.LastName = last_name

    if suffix
      rock.SuffixValueId = suffix.mapped_id
    end

    # @TODO: rock.PhotoId

    unless birth_date
      rock.BirthDay = nil
      rock.BirthMonth = nil
      rock.BirthYear = nil
    else
      rock.BirthDay = birth_date.mday
      rock.BirthMonth = birth_date.month
      rock.BirthYear = birth_date.year
    end

    if gender
      rock.Gender = gender_record.mapped_id
    end

    if marital_status
      rock.MaritalStatusValueId = marital_status_record.mapped_id
    end

    rock.AnniversaryDate = nil_if_1900 anniversary_date
    gradDate = nil_if_1900 graduation_date
    rock.GraduationYear = gradDate ? gradDate.year : nil

    # @TODO: rock.GivingGroupId, giving_unit_id

    ##########################
    # ARENA has multiple emails,
    # Rock has one?
    arena_email = emails.where(active: true).first
    rock.EmailPreference ||= 0 # EmailAllowed - What is arena spec?
    if arena_email
      rock.Email = arena_email.email
      rock.IsEmailActive = true
      rock.EmailNote = arena_email.notes
    else
      rock.IsEmailActive = false
    end

    rock.SystemNote = self.Notes
    rock.Guid = guid
    rock.CreatedDateTime = date_created
    rock.ModifiedDateTime = date_modified

    rock.save!
    self.mapping = map
    mapping.save!

    rock.make_alias

    # HasMany
    # ################
    phones.each(&:sync_to_rock!)
  end

  def is_deceased?
    # Arena's inactive reason for deceased is: 356
    @is_deceased ||=
      (inactive_reason_luid.to_i == 356)
  end

  def birth_date
    nil_if_1900 read_attribute(:birth_date)
  end

  def aniversary_date
    nil_if_1900 read_attribute(:anniversary_date)
  end

  def graduation_date
    nil_if_1900 read_attribute(:graduation_date)
  end

  def primary_address
    locations.where(primary_address: true).first.address rescue nil
  end

end
