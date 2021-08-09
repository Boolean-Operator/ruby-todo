class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.integer :client_id
      t.string :list_group
      t.string :item
      t.boolean :completed

      t.timestamps
    end
  end
end
