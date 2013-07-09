class ApiKey < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  
  # relationships .............................................................
  belongs_to :tokenable, polymorphic: true

  # validations ...............................................................
  validates :scope, presence: true, inclusion: { in: %w( session api ) }

  # callbacks .................................................................
  before_create :generate_access_token, :set_expiry_date

  # scopes ....................................................................
  scope :session, -> { where(scope: 'session') }
  scope :api,     -> { where(scope: 'api') }
  scope :active,  -> { where("expired_at >= ?", Time.now) }

  # additional config .........................................................
  # class methods .............................................................

  # def self.context_for(token)
  #   api_key = where(:access_token => token).first
  #   if api_key
  #     api_key.tokenable
  #   else
  #     nil
  #   end
  # end

  # def self.user_for(token)
  #   ctx = context_for(token)
  #   if ctx && ctx.is_a?(User)
  #     ctx
  #   else
  #     nil
  #   end
  # end

  # public instance methods ...................................................

  def user
    tokenable.is_a?(User) ? tokenable : nil 
  end

  # protected instance methods ................................................
  # private instance methods ..................................................

  private

  def set_expiry_date
    self.expired_at = if self.scope == 'session'
                        4.hours.from_now
                      else
                        30.days_from_now
                      end
  end

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

end
