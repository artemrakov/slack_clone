class CreateTeamChannelMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :team_channel_messages do |t|
      t.references :team_channel, foreign_key: true
      t.references :team, foreign_key: true
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
