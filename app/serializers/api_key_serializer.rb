class ApiKeySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :organization_id, :access_token

  def user_id
    object.user.try(:id)
  end

  def organization_id
    object.organization.try(:id)
  end
end
