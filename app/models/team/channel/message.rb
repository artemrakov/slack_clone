class Team::Channel::Message < ApplicationRecord
  belongs_to :channel
  belongs_to :team
  belongs_to :user

  validates :content, presence: true

  def to_s
    content
  end
end
