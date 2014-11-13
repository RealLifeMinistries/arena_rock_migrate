# == Schema Information
#
# Table name: core_occurrence
#
#  occurrence_id               :integer          not null, primary key
#  date_created                :datetime         not null
#  date_modified               :datetime         not null
#  created_by                  :string(50)       not null
#  modified_by                 :string(50)       not null
#  occurrence_name             :string(50)       not null
#  occurrence_description      :string(1000)     not null
#  occurrence_start_time       :datetime         not null
#  occurrence_end_time         :datetime         not null
#  check_in_start              :datetime         not null
#  check_in_end                :datetime         not null
#  location                    :string(200)      not null
#  location_id                 :integer
#  mission_related             :boolean          not null
#  occurrence_type             :integer          not null
#  location_address_id         :integer
#  membership_required         :boolean          not null
#  occurrence_type_template_id :integer
#  area_id                     :integer
#  occurrence_closed           :boolean          not null
#  foreign_key                 :integer
#

class Arena::Occurrence < Arena::Base
  self.primary_key = 'occurrence_id'
  self.table_name = 'core_occurrence'
end
