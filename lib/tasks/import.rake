namespace :import do
  desc 'import from app_export.json'
  task :app_export => :environment do
    success = 0
    failure = 0
    data = JSON.parse(File.read("#{Rails.root}/public/data/app_export.json"))
    data.each do |node|

      extension_map = {}
      Tag.extensions.each do |t|
        extension_map[t.short_name] = t
      end

      category_map = {}
      Tag.categories.each do |t|
        category_map[t.name] = t
      end

      education_level_map = {}
      Tag.education_levels.each do |t|
        education_level_map[t.name] = t
      end

      app = LtiApp.new
      app.user_id              = 1 # hardcoded for now
      app.name                 = node['name']
      app.short_name           = node['id']
      app.short_description    = node['short_description']
      app.description          = node['description']
      app.testing_instructions = node['test_instructions']
      app.author_name          = node['author_name']
      app.app_type             = node['app_type']
      app.ims_cert_url         = node['ims_link']
      app.banner_image_url     = node['banner_url']
      app.logo_image_url       = node['logo_url']
      app.icon_image_url       = node['icon_url']
      app.cartridge            = node['cartridge']
      if app.save

        if node['extensions'].is_a? Array
          node['extensions'].each do |val|
            app.tags << extension_map[val]
          end
        end

        if node['categories'].is_a? Array
          node['categories'].each do |val|
            app.tags << category_map[val]
          end
        end

        if node['levels'].is_a? Array
          node['levels'].each do |val|
            app.tags << education_level_map[val]
          end
        end

        success += 1
      else
        failure += 1
      end
    end
    puts "#{success} added with #{failure} failures"
  end
end