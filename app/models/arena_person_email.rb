# == Schema Information
#
# Table name: arena_person_emails
#
#  email_id      :integer          not null, primary key
#  date_created  :datetime
#  date_modified :datetime
#  created_by    :string
#  modified_by   :string
#  person_id     :integer
#  active        :boolean
#  email_order   :integer
#  email         :string
#  notes         :string
#

class ArenaPersonEmail < ActiveRecord::Base
  self.primary_key = :email_id
  belongs_to :person, class: ArenaPerson
end
