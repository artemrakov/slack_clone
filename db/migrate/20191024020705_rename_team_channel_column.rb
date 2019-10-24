class RenameTeamChannelColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :team_channel_messages, :team_channel_id, :channel_id
  end
end
