class CreateRequestsUsers < ActiveRecord::Migration
  def change
    create_table :requests_users, id: false do |t|
      t.integer :request_id, null: false
      t.integer :user_id, null: false
    end

    add_index :requests_users, [:request_id, :user_id], unique: true
  end
end
