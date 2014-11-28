# == Schema Information
#
# Table name: arena_attribute_types
#
#  id   :integer          not null, primary key
#  name :string
#  type :string
#

class ArenaAttributeType < ActiveRecord::Base
  has_rock_mapping

  def handle_qualifiers_for!(attr)
    # Nothing at base level
  end


end
