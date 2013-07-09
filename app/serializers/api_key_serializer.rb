class ApiKeySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :access_token

  def user_id
    object.user.try(:id)
  end
end
