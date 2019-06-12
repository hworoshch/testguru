class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :author, :int
  end
end
