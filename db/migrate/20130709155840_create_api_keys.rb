class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.integer :tokenable_id
      t.string :tokenable_type
      t.string :access_token
      t.string :scope
      t.datetime :expired_at
      t.datetime :created_at
    end

    add_index :api_keys, :access_token, unique: true
  end
end
