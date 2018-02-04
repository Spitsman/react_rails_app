class ChangeMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :first_team_id
    remove_column :matches, :second_team_id
    remove_column :matches, :first_team_score
    remove_column :matches, :second_team_score
  end
end
