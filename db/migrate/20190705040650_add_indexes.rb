class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :answers, :question_id
    add_index :questions, :test_id
    add_index :tests, :author_id
    add_index :tests, :category_id
    add_index :tests, %i[title level], unique: true
  end
end
