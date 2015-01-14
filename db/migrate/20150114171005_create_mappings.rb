class CreateMappings < ActiveRecord::Migration
  def up
    unless ActiveRecord::Base.connection.tables.include? 'mappings'
      create_table :mappings do |t|
        t.string :arena_record_type, null: false
        t.string :arena_record_id, null: false
        t.string :rock_record_type, null: false
        t.string :rock_record_id, null: false
      end
    end
  end
end
