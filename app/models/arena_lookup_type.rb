# == Schema Information
#
# Table name: arena_lookup_types
#
#  lookup_type_id    :integer          not null, primary key
#  guid              :uuid
#  lookup_type_name  :string
#  lookup_type_desc  :string
#  lookup_category   :string
#  qualifier_1_title :string
#  qualifier_2_title :string
#  organization_id   :integer
#  system_flag       :boolean
#  qualifier_3_title :string
#  qualifier_4_title :string
#  qualifier_5_title :string
#  qualifier_6_title :string
#  qualifier_7_title :string
#  qualifier_8_title :string
#

class ArenaLookupType < ArenaBase
  self.primary_key = :lookup_type_id
  has_rock_mapping
  has_many :lookups, class: ArenaLookup, foreign_key: :lookup_type_id
end
