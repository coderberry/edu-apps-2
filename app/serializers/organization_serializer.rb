class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :memberships, embed: :id#, include: true
end
