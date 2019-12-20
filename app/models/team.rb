class Team < ApplicationRecord
  include AASM

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: true, format: { with: /\A\S*\z/ }
  validates :description, presence: true

  has_many :team_invitations, dependent: :destroy
  has_many :users, through: :team_invitations
  has_many :channels, dependent: :destroy
  has_many :messages, dependent: :destroy

  belongs_to :owner, class_name: "User"

  def self.creation_states
    states - [:archived]
  end

  def self.states
    aasm.states.map(&:name)
  end

  def to_s
    name
  end

  def find_channel(id)
    channels.friendly.find(id)
  end

  def guest?(user)
    !users.include?(user)
  end

  after_create do
    channel = channels.create(name: Team::Channel::DEFAULT)
    channel.channel_invitations.create!(user: owner)
  end

  aasm column: :state do
    state :public_access, initial: true
    state :private_access
    state :archived

    event :to_public do
      transitions from: %i[private_access archived], to: :public_access
    end

    event :to_private do
      transitions from: %i[public_access archived], to: :private_access
    end

    event :to_archived do
      transitions from: %i[public_access private_access], to: :archived
    end
  end
end
