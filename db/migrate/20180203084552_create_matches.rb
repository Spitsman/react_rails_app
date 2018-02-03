class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :first_team_id
      t.integer :second_team_id
      t.integer :first_team_score
      t.integer :second_team_score
      t.date :date
    end
  end
end
