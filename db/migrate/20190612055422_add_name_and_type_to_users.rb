class AddNameAndTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    add_column :users, :lastname, :string
    add_index :users, :type
  end
end
