class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.boolean :admin, null: false, default: false

      t.string    :crypted_password
      t.string    :password_salt
      t.string    :persistence_token

      t.timestamps
    end
  end
end
