# == Schema Information
#
# Table name: orgn_campus
#
#  campus_id        :integer          not null, primary key
#  date_created     :datetime         not null
#  date_modified    :datetime         not null
#  created_by       :string(50)       not null
#  modified_by      :string(50)       not null
#  guid             :uuid             not null
#  organization_id  :integer          not null
#  name             :string(100)      not null
#  url              :string(100)      not null
#  description      :text             not null
#  leader_person_id :integer
#  address_id       :integer
#  foreign_key      :integer
#

class Arena::Campus < Arena::Base
  self.table_name = 'orgn_campus'
  self.primary_key = :campus_id
end
