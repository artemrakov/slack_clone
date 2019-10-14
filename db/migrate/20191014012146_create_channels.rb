class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :team_channels do |t|
      t.string :name, null: false
      t.string :slug
      t.references :team, foreign_key: true

      t.timestamps
    end

    add_index :team_channels, :slug
  end
end
