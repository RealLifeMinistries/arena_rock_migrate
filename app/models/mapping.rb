# == Schema Information
#
# Table name: mappings
#
#  id                :integer          not null, primary key
#  arena_record_type :string           not null
#  arena_record_id   :string           not null
#  rock_record_type  :string           not null
#  rock_record_id    :string           not null
#  created_at        :datetime
#  updated_at        :datetime
#

class Mapping < ActiveRecord::Base
  belongs_to :rock_record, polymorphic: true
  belongs_to :arena_record, polymorphic: true

  def rock_record
    return @rock_record if @rock_record
    return nil unless rock_record_id
    pkey = rock_record_id.to_s.include?(",") ? rock_record_id.to_s.split(',') : rock_record_id.to_s
    @rock_record = rock_record_type.constantize.find(pkey)
  end

  def arena_record
    return @arena_record if @arena_record
    return nil unless arena_record_id
    pkey = arena_record_id.to_s.include?(",") ? arena_record_id.to_s.split(',') : arena_record_id.to_s
    @arena_record = arena_record_type.constantize.find(pkey)
  end
end
