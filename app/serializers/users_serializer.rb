class UsersSerializer < ActiveModel::Serializer
  attributes :id
  attributes :first_name, :last_name, :email
end
