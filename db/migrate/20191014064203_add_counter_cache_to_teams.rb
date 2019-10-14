class AddCounterCacheToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :channels_count, :integer, null: false, default: 0
    add_column :teams, :users_count, :integer, null: false, default: 0
  end
end
