class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :memberships, embed: :ids, include: true
end
