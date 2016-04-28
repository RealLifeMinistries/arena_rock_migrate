# == Schema Information
#
# Table name: core_person_email
#
#  email_id      :integer          not null, primary key
#  date_created  :datetime         not null
#  date_modified :datetime         not null
#  created_by    :varchar(50)      default(""), not null
#  modified_by   :varchar(50)      default(""), not null
#  person_id     :integer          not null
#  active        :boolean          default(TRUE), not null
#  email_order   :integer          default(0), not null
#  email         :varchar(80)      default(""), not null
#  notes         :varchar(500)     default(""), not null
#

class Arena::PersonEmail < Arena::Base
  self.table_name = 'core_person_email'
  self.primary_key = :email_id
end
