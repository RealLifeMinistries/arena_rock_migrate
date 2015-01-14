class CreateArenaCampuses < ActiveRecord::Migration
  def change
    create_table :arena_campuses, primary_key: :campus_id do |t|
      t.datetime :date_created
      t.datetime :date_modified
      t.string :created_by
      t.string :modified_by
      t.uuid :guid
      t.integer :organization_id
      t.string :name
      t.string :url
      t.string :description
      t.integer :leader_person_id
      t.integer :address_id
      t.integer :foreign_key
    end
  end
end
