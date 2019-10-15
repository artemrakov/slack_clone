class Team < ApplicationRecord
  include AASM

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: true, format: { with: /\A\S*\z/ }

  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations
  has_many :channels, dependent: :destroy

  belongs_to :owner, class_name: "User"

  def to_s
    name
  end

  def find_channel(id)
    channels.friendly.find(id)
  end

  aasm column: :state do 
    state :public_access, initial: true
    state :private_access
    state :archived

    event :to_public do
      transitions from: [:private_access, :archived], to: :public_access
    end

    event :to_private do 
      transitions from: [:public_access, :archived], to: :private_access
    end

    event :to_archived do
      transitions from: [:public_access, :private_access], to: :archived
    end
  end
end
