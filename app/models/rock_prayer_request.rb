# == Schema Information
#

class RockPrayerRequest < RockBase
  self.primary_key = :Id
  self.table_name = "PrayerRequest"

  belongs_to :category, class_name: "RockCategory", foreign_key: 'CategoryId'
  belongs_to :group, class_name: "RockGroup", foreign_key: 'GroupId'
  belongs_to :person, class_name: "RockPersonAlias", foreign_key: 'RequestedByPersonAliasId'
end
