# == Schema Information
#
# Table name: core_person
#
#  person_id               :integer          not null, primary key
#  guid                    :uuid
#  date_created            :datetime         not null
#  date_modified           :datetime         not null
#  date_last_verified      :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  created_by              :varchar(50)      default(""), not null
#  modified_by             :varchar(50)      default(""), not null
#  title_luid              :integer
#  nick_name               :varchar(50)      default(""), not null
#  first_name              :varchar(40)      default(""), not null
#  middle_name             :varchar(40)      default(""), not null
#  last_name               :varchar(40)      default(""), not null
#  suffix_luid             :integer
#  birth_date              :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  gender                  :integer          default(-1), not null
#  postal_code             :varchar(10)      default(""), not null
#  Notes                   :varchar(255)     not null
#  marital_status          :integer
#  anniversary_date        :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  member_status           :integer
#  record_status           :integer          default(0), not null
#  medical_information     :varchar(1000)    default(""), not null
#  blob_id                 :integer
#  inactive_reason_luid    :integer
#  foreign_key             :integer
#  foreign_key2            :integer
#  organization_id         :integer          not null
#  active_meter            :integer          default(0), not null
#  last_attended           :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  contribute_individually :boolean          default(FALSE), not null
#  giving_unit_id          :varchar(50)      default(""), not null
#  graduation_date         :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  social_security         :varbinary(500)
#  print_statement         :boolean          default(TRUE), not null
#  envelope_number         :integer          default(-1), not null
#  include_on_envelope     :boolean
#  staff_member            :boolean          default(FALSE), not null
#  campus_id               :integer
#  business                :boolean          default(FALSE), not null
#

class Arena::Person < Arena::Base
  self.table_name = :core_person
  self.primary_key = :person_id
end
