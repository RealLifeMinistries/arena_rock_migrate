# == Schema Information
#
# Table name: arena_lookups
#
#  lookup_id         :integer          not null, primary key
#  guid              :uuid
#  lookup_type_id    :integer
#  lookup_value      :string
#  lookup_qualifier  :string
#  lookup_qualifier2 :string
#  lookup_qualifier3 :string
#  lookup_qualifier4 :string
#  lookup_qualifier5 :string
#  lookup_qualifier6 :string
#  lookup_qualifier7 :string
#  lookup_qualifier8 :string
#  lookup_order      :integer
#  active            :boolean
#  system_flag       :boolean
#  foreign_key       :integer
#

class ArenaLookup < ActiveRecord::Base
  self.primary_key = :lookup_id
  has_rock_mapping
  belongs_to :lookup_type, class_name: "ArenaLookupType", primary_key: 'lookup_type_id'

  def sync_to_rock!
    map = mapping || build_mapping
    rock = map.rock_record ||= RockDefinedValue.new

    rock.IsSystem ||= false # required
    rock.Guid ||= guid
    rock.Value = lookup_value
    rock.Order ||= lookup_order
    rock.DefinedTypeId ||= lookup_type.mapped_id  
    rock.save!
    self.mapping = map
    mapping.save!
  end
end
