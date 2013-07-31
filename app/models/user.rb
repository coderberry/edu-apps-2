class User < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  has_many :memberships, dependent: :destroy
  has_many :organizations, through: :memberships
  has_many :api_keys, as: :tokenable
  has_many :reviews

  # validations ...............................................................
  validates :email, uniqueness: true, format: { with: /.+@.+\..+/ }
  validates :name, presence: true
  validates :password, presence: { on: :create, if: :password_required? }, length: { minimum: 6, allow_blank: true, if: :password_required? }

  # callbacks .................................................................
  # scopes ....................................................................
  # additional config .........................................................
  has_secure_password :validations => false

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

  def is_member?(organization)
    !!memberships.where(organization_id: organization.id).exists?
  end

  def avatar_url_with_backup
    if self.avatar_url.present?
      self.avatar_url 
    else
      email_hash = Digest::MD5.hexdigest(self.email.downcase.strip)
      "http://www.gravatar.com/avatar/#{email_hash}?s=50&d=retro"
    end
  end

  def as_tiny_json
    {
      name: self.name,
      url: self.url,
      avatar_url: self.avatar_url_with_backup
    }
  end
  
  # protected instance methods ................................................
  # private instance methods ..................................................
  private
  def password_required?
    self.is_activated?
  end
end
