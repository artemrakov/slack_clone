class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :password, presence: true, on: :create

  has_many :invitations, dependent: :destroy
  has_many :teams, through: :invitations
  has_many :owned_teams,
           foreign_key: :owner_id,
           class_name: 'Team',
           dependent: :destroy,
           inverse_of: :owner

  def guest?
    false
  end

  def find_team(id)
    teams.friendly.find(id)
  end

  def member_of_team?(team)
    teams.include?(team)
  end
end
