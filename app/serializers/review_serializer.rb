class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comments, :created_at, :reviewed_on, :user

  def reviewed_on
    object.created_at.strftime("%b %d, %Y")
  end

  def user
    object.user.as_tiny_json
  end
end
