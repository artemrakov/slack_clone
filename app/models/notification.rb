class Notification < ApplicationRecord
  include AASM

  validates :kind, inclusion: { in: %w[new_channel_message new_tagged_message new_personal_message] }
  validates :resource_id, presence: true
  validates :resource_type, presence: true

  belongs_to :user
  belongs_to :resource, polymorphic: true

  aasm column: :state do
    state :unread, initial: true
    state :read

    event :mark_as_read do
      transitions from: :unread, to: :read
    end
  end
end
