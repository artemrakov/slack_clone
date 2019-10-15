class AddStateToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :state, :string
  end
end
