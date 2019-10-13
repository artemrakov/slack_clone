class Team < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true

  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations

  belongs_to :owner, class_name: "User"

  def to_s
    name
  end
end
