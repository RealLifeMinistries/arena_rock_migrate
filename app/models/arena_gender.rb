# == Schema Information
#
# Table name: arena_genders
#
#  id   :integer          not null, primary key
#  name :string           not null
#

class ArenaGender < ArenaBase
  has_rock_mapping
end
