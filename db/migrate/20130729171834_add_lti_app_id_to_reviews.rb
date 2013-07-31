class AddLtiAppIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :lti_app_id, :integer
    add_index :reviews, :lti_app_id
  end
end
