class Organization < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :api_keys, as: :tokenable

  validates :name, presence: true
end
