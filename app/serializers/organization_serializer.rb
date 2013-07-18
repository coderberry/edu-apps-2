class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :access_token

  has_many :memberships, embed: :ids, include: true
  
  def access_token
    object.api_keys.active.api.order('id desc').first.try(:access_token)
  end
end
