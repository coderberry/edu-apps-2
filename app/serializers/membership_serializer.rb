class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :is_admin

  has_one :user, embed: :ids, include: true
  has_one :organization, embed: :ids, include: true
end
