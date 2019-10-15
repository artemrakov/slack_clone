class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :team, counter_cache: :users_count
end
