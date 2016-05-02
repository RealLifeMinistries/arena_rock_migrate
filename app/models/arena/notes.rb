# == Schema Information
#
# Table name: core_person_history
#
#  person_history_id    :integer          not null, primary key
#  date_created         :datetime         not null
#  date_modified        :datetime         not null
#  created_by           :string(50)       default(""), not null
#  modified_by          :string(50)       default(""), not null
#  person_id            :integer          not null
#  history_type_luid    :integer          not null
#  history_qualifier_id :integer          default(-1), not null
#  system_history       :boolean          default(FALSE), not null
#  history              :text
#  organization_id      :integer          default(-1), not null
#  display_flag         :boolean          default(FALSE), not null
#  display_expiration   :datetime         default(1900-01-01 00:00:00 UTC), not null
#  private_flag         :boolean          default(FALSE), not null
#

class Arena::Notes < Arena::Base
  self.primary_key = 'person_history_id'
  self.table_name = 'core_person_history'
end

