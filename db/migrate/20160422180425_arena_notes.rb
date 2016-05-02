class ArenaNotes < ActiveRecord::Migration
  def change
    create_table :arena_notes, id: false do |t|
      t.integer	:person_history_id,	primary_key: true
      t.datetime	:date_created	
      t.datetime	:date_modified
      t.string	:created_by
      t.string	:modified_by
      t.integer	:person_id
      t.integer	:history_type_luid
      t.integer	:history_qualifier_id
      t.boolean	:system_history
      t.text	:history
      t.integer	:organization_id
      t.boolean	:display_flag
      t.datetime	:display_expiration
      t.boolean	:private_flag
    end
  end
end
