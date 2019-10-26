class Team::Channel::Message < ApplicationRecord
  belongs_to :channel
  belongs_to :team

  validates :content, presence: true

  def to_s
    content
  end
end
