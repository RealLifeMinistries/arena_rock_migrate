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
  belongs_to :arena_attribute, class: ArenaAttribute, foreign_key: :attribute_id
  belongs_to :person, class: ArenaPerson

  has_rock_mapping

  def sync_to_rock!
    unless arena_attribute.does_not_transfer?

      map = mapping || build_mapping
      rock = map.rock_record ||= RockAttributeValue.new
      
      rock.IsSystem ||= false
      rock.EntityId = person.mapped_id 
      rock.Guid ||= SecureRandom.uuid
      rock.CreatedDateTime ||= date_created
      rock.ModifiedDateTime ||= date_modified
      rock.AttributeId = arena_attribute.mapped_id


      catch(:skip_attribute) do  
        arena_attribute.set_rock_value(rock,self)    
        rock.save!
        map.save!
      end

    end
  end
end
