class CreateArenaBlobs < ActiveRecord::Migration
  def change
    create_table :arena_blobs, id: false do |t|
      t.integer :blob_id, primary_key: true
      t.uuid :guid
      t.datetime :date_created
      t.datetime :date_modified
      t.string :created_by
      t.string :modified_by
      t.string :file_ext
      t.string :mime_type
      t.binary :blob
      t.string :original_file_name
    end
  end
end
