class Team::Channel < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: { scope: :team }

  belongs_to :team
end
