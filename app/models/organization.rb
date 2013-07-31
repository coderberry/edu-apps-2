class Organization < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :api_keys, as: :tokenable

  validates :name, presence: true

  def regenerate_api_key
    api_keys.map(&:expire)
    api_keys.active.api.create
  end
end
