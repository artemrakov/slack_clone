class CreateChannelInvitation < ActiveRecord::Migration[6.0]
  def change
    create_table :channel_invitations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :team_channel, null: false, foreign_key: true
    end
  end
end
