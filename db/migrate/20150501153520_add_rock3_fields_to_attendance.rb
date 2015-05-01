class AddRock3FieldsToAttendance < ActiveRecord::Migration
  def change
    change_table :rock_attendance do |t|
      t.integer :RSVP, default: 0, null: false
      t.boolean :DidNotOccur
      t.boolean :Processed
    end
  end
end
