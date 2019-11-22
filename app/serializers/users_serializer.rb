class UsersSerializer < ActiveModel::Serializer
  attributes :id
  attributes :first_name, :last_name
  has_many :messages, serializer: Team::Channel::MessagesSerializer
end
