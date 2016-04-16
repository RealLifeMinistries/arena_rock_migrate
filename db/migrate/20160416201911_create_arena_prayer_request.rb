class CreateArenaPrayerRequest < ActiveRecord::Migration
  def change
    create_table :arena_prayer_requests, id: false do |t|
      t.integer :request_id, primary_key: true
      t.datetime :date_created
      t.datetime :date_modified
      t.string :created_by
      t.string :modified_by
      t.integer :organization_id
      t.integer :content_category_luid
      t.integer :person_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :postal_code
      t.integer :is_public
      t.datetime :expire_date
      t.integer :renewal_count
      t.integer :source_luid
      t.integer :category_luid
      t.datetime :approved_datetime
      t.integer :answer_updated
      t.text :answer_text
      t.text :request_text
      t.integer :foreign_key
      t.uuid :guid
      t.integer :expire_notified
      t.integer :approver_id
    end
  end
end
