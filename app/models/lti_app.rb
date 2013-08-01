class LtiApp < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :reviews, dependent: :destroy
  validates :short_name, presence: true, uniqueness: true

  scope :inclusive, -> do
    select 'lti_apps.*'
  end

  scope :include_rating, -> do
    select '(select avg("rating") FROM "reviews" where "reviews"."lti_app_id" = "lti_apps"."id") as "average_rating"'
  end

  scope :include_total_ratings, -> do
    select '(select count("id") FROM "reviews" where "reviews"."lti_app_id" = "lti_apps"."id") as "total_ratings"'
  end
end
