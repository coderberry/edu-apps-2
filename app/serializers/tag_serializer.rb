class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_name, :context

  # has_many :lti_apps, embed: :ids
end
