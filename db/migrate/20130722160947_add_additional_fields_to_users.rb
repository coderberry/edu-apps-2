class AddAdditionalFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_url, :string, limit: 1000
    add_column :users, :url, :string, limit: 1000
    add_column :users, :is_activated, :boolean, default: false
  end
end
