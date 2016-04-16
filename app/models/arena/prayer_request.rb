# == Schema Information
#
# Table name: pryr_request
#
#  request_id            :integer          not null, primary key
#  date_created          :datetime         not null
#  date_modified         :datetime         not null
#  created_by            :varchar(50)      default(""), not null
#  modified_by           :varchar(50)      default(""), not null
#  organization_id       :integer          not null
#  content_category_luid :integer
#  person_id             :integer
#  first_name            :varchar(50)      default(""), not null
#  last_name             :varchar(50)      default(""), not null
#  email                 :varchar(80)      default(""), not null
#  postal_code           :varchar(10)      not null
#  request_response      :boolean          default(FALSE), not null
#  is_public             :boolean          default(FALSE), not null
#  expire_date           :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  renewal_count         :integer          default(0), not null
#  source_luid           :integer
#  category_luid         :integer
#  approved_datetime     :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  answer_updated        :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  answer_approved       :boolean          default(FALSE), not null
#  request_text          :text_basic(21474 default("")
#  answer_text           :text_basic(21474
#  foreign_key           :integer
#  guid                  :uuid
#  expire_notified       :boolean          default(FALSE), not null
#  approver_id           :integer
#

class Arena::PrayerRequest < Arena::Base
  self.primary_key = 'request_id'
  self.table_name = 'pryr_request'
end
