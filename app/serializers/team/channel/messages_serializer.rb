class Team::Channel::MessagesSerializer < ActiveModel::Serializer
  attributes :id
  attributes :content
  belongs_to :user, serializer: UsersSerializer
end
