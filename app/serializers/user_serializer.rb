class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :memberships, embed: :ids, include: true
end
