class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.decimal :amount, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
