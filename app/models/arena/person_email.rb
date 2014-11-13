# == Schema Information
#
# Table name: core_person_email
#
#  email_id      :integer          not null, primary key
#  date_created  :datetime         not null
#  date_modified :datetime         not null
#  created_by    :string(50)       not null
#  modified_by   :string(50)       not null
#  person_id     :integer          not null
#  active        :boolean          not null
#  email_order   :integer          not null
#  email         :string(80)       not null
#  notes         :string(500)      not null
#

class Arena::PersonEmail < Arena::Base
  self.table_name = 'core_person_email'
  self.primary_key = :email_id
end
