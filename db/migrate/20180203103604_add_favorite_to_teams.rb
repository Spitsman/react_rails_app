class AddFavoriteToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :favorite, :boolean, defalut: false
  end
end
