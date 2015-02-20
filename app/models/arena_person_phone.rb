# == Schema Information
#
# Table name: arena_person_phones
#
#  person_id             :integer          not null, primary key
#  phone_luid            :integer          not null, primary key
#  phone_number          :string
#  phone_ext             :string
#  unlisted              :boolean
#  phone_number_stripped :string
#  sms_enabled           :boolean
#

class ArenaPersonPhone < ArenaBase
  self.primary_key = :person_id,:phone_luid

  belongs_to :person, class: ArenaPerson
  belongs_to :phone_type, class: ArenaLookup, foreign_key: :phone_luid

  has_rock_mapping

  def sync_to_rock!
    map = self.mapping || build_mapping
    rock = map.rock_record ||= RockPhoneNumber.new

    rock.IsSystem = false #?
    rock.PersonId = person.mapped_id
    rock.Number = phone_number_stripped
    rock.NumberFormatted = phone_number
    rock.Extension = phone_ext
    rock.NumberTypeValueId = phone_type.mapped_id
    rock.IsMessagingEnabled = sms_enabled?
    rock.IsUnlisted = unlisted?
    rock.Guid ||= SecureRandom.uuid()

    rock.save!
    self.mapping = map
    map.save!
  end
end
