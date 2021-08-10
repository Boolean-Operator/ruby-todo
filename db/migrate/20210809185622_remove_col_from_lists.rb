class RemoveColFromLists < ActiveRecord::Migration[6.1]
  def change
    remove_column :lists, :client_id, :integer
    rename_column :lists, :list_group, :title
  end
end
