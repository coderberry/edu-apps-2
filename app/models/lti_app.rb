class LtiApp < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  validates :short_name, presence: true, uniqueness: true
end
