require "rubygems"
require "active_record"

conf = YAML::load(File.open(File.dirname(__FILE__) + '/../database.yml'))
ActiveRecord::Base.establish_connection(conf['sqlite3'])

ActiveRecord::Base.logger = Logger.new(STDOUT)
