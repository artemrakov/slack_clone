class RenameChannelInvitationColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :channel_invitations, :team_channel_id, :channel_id
  end
end
