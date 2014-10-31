# == Schema Information
#
# Table name: core_family
#
#  family_id       :integer          not null, primary key
#  date_created    :datetime         not null
#  date_modified   :datetime         not null
#  created_by      :string(50)       not null
#  modified_by     :string(50)       not null
#  family_name     :string(100)      not null
#  foreign_key     :integer
#  organization_id :integer          not null
#

class Arena::Family < Arena::Base
  self.table_name = :core_family
  self.primary_key = :family_id
end
