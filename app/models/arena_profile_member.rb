# == Schema Information
#
# Table name: arena_profile_members
#
#  profile_id    :integer          not null, primary key
#  person_id     :integer          not null, primary key
#  date_created  :datetime
#  date_modified :datetime
#  created_by    :string
#  modified_by   :string
#  source_luid   :integer
#  status_luid   :integer
#  notes         :string
#  date_pending  :datetime
#  date_inreview :datetime
#  date_active   :datetime
#  date_dormant  :datetime
#

class ArenaProfileMember < ActiveRecord::Base
  self.primary_key = :profile_id, :person_id
  belongs_to :person, class: ArenaPerson
  belongs_to :profile, class: ArenaProfile
  belongs_to :source, class: ArenaLookup, foreign_key: :source_luid
  belongs_to :status, class: ArenaLookup, foreign_key: :status_luid
end
