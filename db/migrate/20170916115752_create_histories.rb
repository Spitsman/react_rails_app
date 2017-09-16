class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :user_id, null: false
      t.string :user_role, null: false
      t.datetime :created_at, null: false
      t.string :old_value
      t.string :new_value, null: false
      t.string :field, null: false
      t.integer :request_id, null: false
    end
  end
end
