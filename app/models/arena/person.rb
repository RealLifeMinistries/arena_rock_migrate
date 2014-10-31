# == Schema Information
#
# Table name: core_person
#
#  person_id               :integer          not null, primary key
#  guid                    :uuid
#  date_created            :datetime         not null
#  date_modified           :datetime         not null
#  date_last_verified      :datetime         not null
#  created_by              :string(50)       not null
#  modified_by             :string(50)       not null
#  title_luid              :integer
#  nick_name               :string(50)       not null
#  first_name              :string(40)       not null
#  middle_name             :string(40)       not null
#  last_name               :string(40)       not null
#  suffix_luid             :integer
#  birth_date              :datetime         not null
#  gender                  :integer          not null
#  postal_code             :string(10)       not null
#  Notes                   :string(255)      not null
#  marital_status          :integer
#  anniversary_date        :datetime         not null
#  member_status           :integer
#  record_status           :integer          not null
#  medical_information     :string(1000)     not null
#  blob_id                 :integer
#  inactive_reason_luid    :integer
#  foreign_key             :integer
#  foreign_key2            :integer
#  organization_id         :integer          not null
#  active_meter            :integer          not null
#  last_attended           :datetime         not null
#  contribute_individually :boolean          not null
#  giving_unit_id          :string(50)       not null
#  graduation_date         :datetime         not null
#  social_security         :binary(500)
#  print_statement         :boolean          not null
#  envelope_number         :integer          not null
#  include_on_envelope     :boolean
#  staff_member            :boolean          not null
#  campus_id               :integer
#  business                :boolean          not null
#

class Arena::Person < Arena::Base
  self.table_name = :core_person
  self.primary_key = :person_id
end
