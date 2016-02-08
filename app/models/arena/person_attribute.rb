# == Schema Information
#
# Table name: core_person_attribute
#
#  person_id      :integer          not null, primary key
#  attribute_id   :integer          not null, primary key
#  int_value      :integer
#  varchar_value  :varchar(250)
#  datetime_value :datetime
#  decimal_value  :decimal(18, 4)
#  date_created   :datetime         not null
#  date_modified  :datetime         not null
#  created_by     :varchar(50)      not null
#  modified_by    :varchar(50)      not null
#

class Arena::PersonAttribute < Arena::Base
  self.table_name = :core_person_attribute
  self.primary_keys = :person_id, :attribute_id
end
