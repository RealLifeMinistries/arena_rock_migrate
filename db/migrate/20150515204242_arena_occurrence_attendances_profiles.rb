class ArenaOccurrenceAttendancesProfiles < ActiveRecord::Migration
  def change
    create_table :arena_occurrence_attendances_profiles, id: false do |t|
      t.references :occurrence
      t.references :profile
    end
    add_index :arena_occurrence_attendances_profiles, [:occurrence_id,:profile_id], unique:true,name: :arena_profile_attendance_join
  end
end
