class Team::Channel < ApplicationRecord
  DEFAULT = 'general'

  extend FriendlyId
  friendly_id :name, use: :scoped, scope: :team

  validates :name, presence: true, uniqueness: { scope: :team }, format: { with: /\A\S*\z/ }

  belongs_to :team, counter_cache: true

  def to_s
    name
  end
end
