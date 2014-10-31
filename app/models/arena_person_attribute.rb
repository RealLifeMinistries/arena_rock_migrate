# == Schema Information
#
# Table name: arena_person_attributes
#
#  person_id      :integer          not null, primary key
#  attribute_id   :integer          not null, primary key
#  int_value      :integer
#  varchar_value  :string
#  datetime_value :datetime
#  decimal_value  :decimal(18, 4)
#  date_created   :datetime
#  date_modified  :datetime
#  created_by     :string
#  modified_by    :string
#

class ArenaPersonAttribute < ActiveRecord::Base
  self.primary_keys = :person_id, :attribute_id
end
