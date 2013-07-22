class CreateLtiApps < ActiveRecord::Migration
  def change
    create_table :lti_apps do |t|
      t.references :user, index: true
      t.string :short_name, null: false
      t.string :name, null: false
      t.text :description
      t.string :status, null: false, default: 'pending'
      t.text :testing_instructions
      t.string :support_url, limit: 1000
      t.string :author_name
      t.boolean :is_public
      t.string :app_type
      t.string :ims_cert_url, limit: 1000
      t.string :preview_url, limit: 1000
      t.string :config_url, limit: 1000
      t.string :data_url, limit: 1000
      t.json :cartridge
      t.string :banner_image_url
      t.string :logo_image_url
      t.string :icon_image_url
      t.string :short_description

      t.timestamps
    end
    
    add_index :lti_apps, :short_name, :unique => true
  end
end
