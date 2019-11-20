class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :password, presence: true, on: :create

  has_many :team_invitations, dependent: :destroy
  has_many :teams, through: :team_invitations
  has_many :channel_invitations, dependent: :destroy
  has_many :channels, through: :channel_invitations
  has_many :owned_teams,
           foreign_key: :owner_id,
           class_name: 'Team',
           dependent: :destroy,
           inverse_of: :owner
  has_many :notifications, dependent: :destroy
  has_many :messages, dependent: :destroy, class_name: 'Team::Channel::Message'

  def guest?
    false
  end

  def find_team(id)
    teams.friendly.find(id)
  end

  def all_teams
    (teams + owned_teams).uniq
  end

  def member_of_team?(team)
    teams.include?(team)
  end

  def to_s
    first_name
  end
end
