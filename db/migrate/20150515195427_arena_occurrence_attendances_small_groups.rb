class ArenaOccurrenceAttendancesSmallGroups < ActiveRecord::Migration
  def change
    create_table :arena_occurrence_attendances_small_groups, id: false do |t|
      t.references :occurrence
      t.references :group
    end
    add_index(:arena_occurrence_attendances_small_groups, [:occurrence_id, :group_id], :unique => true, :name => :arena_attendance_small_groups_join)
  end
end
