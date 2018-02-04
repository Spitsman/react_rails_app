class CreateTeamsInMatches < ActiveRecord::Migration
  def change
    create_table :teams_in_matches do |t|
      t.integer :team_id
      t.integer :match_id
      t.integer :score
    end
  end
end
