# == Schema Information
#
# Table name: arena_families
#
#  family_id       :integer          not null, primary key
#  date_created    :datetime
#  date_modified   :datetime
#  created_by      :string
#  modified_by     :string
#  family_name     :string
#  foreign_key     :integer
#  organization_id :integer
#

class ArenaFamily < ActiveRecord::Base
  self.primary_key = :family_id

  has_many :memberships, foreign_key: :family_id, class: ArenaFamilyMember
  has_many :members, through: :memberships, class: ArenaPerson, foreign_key: :person_id, source: :person

  HOH_ROLE = 9435

  has_rock_mapping

  def sync_to_rock!
    map = self.mapping || build_mapping
    rock = map.rock_record ||= RockGroup.new
    rock.GroupTypeId = RockGroupType::FAMILY
    rock.CreatedDateTime = date_created
    rock.ModifiedDateTime = date_modified
    rock.Name = family_name

    rock.IsSecurityRole = false
    rock.IsSystem = false
    rock.IsActive = true
    rock.Order = 0
    rock.Guid ||= SecureRandom.uuid()

    rock.save!
    self.mapping = map
    map.save!

    memberships.each(&:sync_to_rock!)
  end

  def primary_address
    return @primary_address if @primary_address
    hohs = memberships.where(role_luid: HOH_ROLE).collect(&:person).select{|p| !p.is_deceased?}
    unless hohs.any?
      raise "No Living Head of Household for #{family_name}"
    end
    @primary_address = hohs.min_by(&:birth_date).primary_address
  end
end
