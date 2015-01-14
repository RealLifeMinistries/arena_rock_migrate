class CreateArenaProfileTypes < ActiveRecord::Migration
  def change
    create_table :arena_profile_types do |t|
      t.string 'name'
    end
  end
end
