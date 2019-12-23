class TeamMutator
  def self.create(params, user)
    team = user.owned_teams.build(params)

    if team.save
      team.team_invitations.create!(user: user)
      channel = team.channels.create!(name: Team::Channel::DEFAULT)
      channel.channel_invitations.create!(user: user)
    end

    team
  end
end
