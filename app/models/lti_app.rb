class LtiApp < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :reviews
  validates :short_name, presence: true, uniqueness: true
end
