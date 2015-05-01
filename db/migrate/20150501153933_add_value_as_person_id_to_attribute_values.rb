class AddValueAsPersonIdToAttributeValues < ActiveRecord::Migration
  def change
    change_table :rock_attribute_values do |t|
      t.integer :ValueAsPersonId
    end
  end
end
