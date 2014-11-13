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
  
  belongs_to :member_status_record, foreign_key: :member_status, class: ArenaLookup 
  belongs_to :marital_status_record, foreign_key: :marital_status, class: ArenaLookup
  belongs_to :gender_record, foreign_key: :gender, class: ArenaGender
  belongs_to :inactive_reason_record, foreign_key: :inactive_reason_luid, class: ArenaLookup
  belongs_to :title_record, foreign_key: :title_luid, class: ArenaLookup

  has_many :relationships, class: ArenaRelationship, foreign_key: :person_id
  has_many :family_memberships, foreign_key: :person_id, class: ArenaFamilyMember
  has_many :families, through: :family_memberships, foreign_key: :family_id, class: ArenaFamily
  has_many :addresses, class: ArenaPersonAddress, foreign_key: :person_id
  has_many :phones, class: ArenaPersonPhone, foreign_key: :person_id
  has_many :emails, class: ArenaPersonEmail, foreign_key: :person_id
  has_many :profile_memberships, class: ArenaProfileMember, foreign_key: :person_id
  has_many :profiles, through: :profile_memberships, class: ArenaProfile
  has_many :attribute_values, class: ArenaPersonAttribute, foreign_key: :person_id

end
