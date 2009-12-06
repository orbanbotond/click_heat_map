require 'fileutils'

FileUtils.cp "#{RAILS_ROOT}/vendor/plugins/click_heat_map/public/stylesheets/click_heat_map.css", "#{RAILS_ROOT}/public/stylesheets"
FileUtils.cp "#{RAILS_ROOT}/vendor/plugins/click_heat_map/public/images/testo.png", "#{RAILS_ROOT}/public/images"
