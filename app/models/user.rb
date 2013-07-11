class User < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  has_many :memberships, dependent: :destroy
  has_many :organizations, through: :memberships
  has_many :api_keys, as: :tokenable

  # validations ...............................................................
  validates :email, uniqueness: true, format: { with: /.+@.+\..+/ }
  validates :name, presence: true
  validates :password, presence: { on: :create }, length: { minimum: 6, allow_blank: true }

  # callbacks .................................................................
  # scopes ....................................................................
  # additional config .........................................................
  has_secure_password

  # class methods .............................................................
  # public instance methods ...................................................

  def session_api_key
    api_keys.active.session.create
  end

  def clear_expired_api_keys
    api_keys.expired.destroy_all
  end

  def can_manage?(organization)
    !!memberships.where(organization_id: organization.id).where(is_admin: true).exists?
  end
  
  # protected instance methods ................................................
  # private instance methods ..................................................
end
