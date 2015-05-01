class RemoveGraduationDateAddGraduationYear < ActiveRecord::Migration
  def change
    remove_column :rock_people, :GraduationDate
    add_column :rock_people, :GraduationYear, :integer
  end
end
