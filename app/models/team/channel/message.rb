class Team::Channel::Message < ApplicationRecord
  belongs_to :channel
  belongs_to :team
  belongs_to :user

  has_many :notifications, as: :resource, dependent: :destroy

  validates :content, presence: true

  def to_s
    content
  end
end
