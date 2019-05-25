class AddResultToTestsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :tests_users, :result, :integer, default: 0
  end
end
