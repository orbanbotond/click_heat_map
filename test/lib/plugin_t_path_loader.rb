require 'test/lib/activerecord_connector'
require 'test/fixtures/schema.rb'
require 'active_record/fixtures'

  MODELS_PTH = File.join(File.dirname(__FILE__), '/../../app/models')
  FIXTURES_PTH = File.join(File.dirname(__FILE__), '/../fixtures')
  dep = defined?(ActiveSupport::Dependencies) ? ActiveSupport::Dependencies : ::Dependencies
  dep.load_paths.unshift FIXTURES_PTH
  dep.load_paths.unshift MODELS_PTH
