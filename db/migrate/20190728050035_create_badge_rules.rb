class CreateBadgeRules < ActiveRecord::Migration[5.2]
  def change
    create_table :badge_rules do |t|
      t.string :rule, null: false
      t.string :value
      t.bigint :badge_id

      t.timestamps
    end
  end
end
