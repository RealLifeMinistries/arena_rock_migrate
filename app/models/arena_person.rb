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
class ArenaPerson < ActiveRecord::Base
  self.table_name = 'arena_people'
  self.primary_key = 'person_id'
  has_rock_mapping
  
  belongs_to :member_status_record, foreign_key: :member_status, class: ArenaLookup 
  belongs_to :marital_status_record, foreign_key: :marital_status, class: ArenaLookup
  belongs_to :gender_record, foreign_key: :gender, class: ArenaGender
  belongs_to :inactive_reason, foreign_key: :inactive_reason_luid, class: ArenaLookup
  belongs_to :title, foreign_key: :title_luid, class: ArenaLookup
  belongs_to :suffix, foreign_key: :suffix_luid, class: ArenaLookup

  has_many :relationships, class: ArenaRelationship, foreign_key: :person_id
  has_many :family_memberships, foreign_key: :person_id, class: ArenaFamilyMember
  has_many :families, through: :family_memberships, foreign_key: :family_id, class: ArenaFamily
  has_many :addresses, class: ArenaPersonAddress, foreign_key: :person_id
  has_many :phones, class: ArenaPersonPhone, foreign_key: :person_id
  has_many :emails, class: ArenaPersonEmail, foreign_key: :person_id
  has_many :profile_memberships, class: ArenaProfileMember, foreign_key: :person_id
  has_many :profiles, through: :profile_memberships, class: ArenaProfile
  has_many :attribute_values, class: ArenaPersonAttribute, foreign_key: :person_id


  def sync_to_rock!
    self.mapping ||= build_mapping
    rock = mapping.rock_record ||= RockPerson.new

    # @TODO: rock.RecordTypeValueId
    # @TODO: rock.RecordStatusValueId
    if member_status
      rock.RecordStatusValueId = member_status_record.mapped_id
    end
    # @TODO: rock.RecordStatusReasonValueId
    # @TODO: rock.ConnectionStatusValueId
    # @TODO: rock.IsDeceased
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
    if birth_date?
      rock.BirthDay = birth_date.mday 
      rock.BirthMonth = birth_date.month
      rock.BirthYear = birth_date.year
      rock.BirthDate = birth_date
    end
    if gender
      rock.Gender = gender_record.mapped_id
    end
    if martial_status
      rock.MaritalStatusValueId = martial_status_record.mapped_id
    end
    rock.AnniversaryDate = anniversary_date
    rock.GraduationDate = graduation_date
    # @TODO: rock.GivingGroupId, giving_unit_id
    # @TODO: rock.Email, rock.EmailNote, rock.IsEmailActive, arena?
    rock.SystemNote = self.Notes
    rock.Guid = guid
    rock.CreatedDateTime = date_created
    rock.ModifiedDateTime = date_modified
    rock.save!
    mapping.save!
  end
end
