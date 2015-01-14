class CreateRockCampuses < ActiveRecord::Migration
  def change
    create_table :rock_campuses, primary_key: 'Id' do |t|
      t.boolean 'IsSystem', null: false
      t.string 'Name', null: false
      t.string 'ShortCode'
      t.integer 'LocationId'
      t.uuid 'Guid', null: false
      t.datetime 'CreatedDateTime'
      t.datetime 'ModifiedDateTime'
      t.integer 'CreatedByPersonAliasId'
      t.integer 'ModifiedByPersonAliasId'
      t.string 'ForeignId'
      t.string 'PhoneNumber'
      t.integer 'LeaderPersonAliasId'
      t.string 'ServiceTimes'
      t.string 'Description'
      t.boolean 'IsActive'
      t.string 'Url'
    end
  end
end
