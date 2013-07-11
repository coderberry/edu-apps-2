class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :is_admin

  has_one :user, embed: :id
  has_one :organization, embed: :id, include: true
end
