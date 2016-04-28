# == Schema Information
#
# Table name: arena_prayer_request

class ArenaPrayerRequest < ArenaBase
  self.primary_key = 'request_id'

  belongs_to :category, class_name: "ArenaLookup", foreign_key: :category_luid
  belongs_to :source, class_name: "ArenaLookup", foreign_key: :category_luid
  belongs_to :person, class_name: "ArenaPerson", foreign_key: :person_id

  has_rock_mapping

  def sync_to_rock!
      @map = mapping || build_mapping
      @rock = mapping.rock_record ||= RockPrayerRequest.new
      @rock.Guid ||= (guid || SecureRandom.uuid)
      @rock.FirstName ||= first_name
      @rock.LastName ||= last_name
      @rock.Email ||= email
      @rock.RequestedByPersonAliasId ||= person.mapped_record.person_alias.PersonId
      @rock.CategoryId = get_category_from_source
      @rock.Text ||= request_text
      @rock.IsActive ||= false
      @rock.CreatedDateTime ||= date_created
      @rock.ModifiedDateTime ||= date_modified
      @rock.EnteredDateTime ||= date_created
      @rock.save!
      @map.save!
  end

  def get_category_from_source
    if source.lookup_value.include? 'CDA'
      return RockCategory::PR_CDA
    else
      return RockCategory::PR_POST_FALLS
    end
  end

end
