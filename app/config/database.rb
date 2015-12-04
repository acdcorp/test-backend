Sequel::Model.plugin :schema
Sequel::Model.plugin :validation_helpers
Sequel::Model.plugin :nested_attributes
Sequel::Model.plugin :boolean_readers
Sequel::Model.plugin :table_select
Sequel::Model.plugin :json_serializer
Sequel::Model.plugin :dirty

# Force all strings to be UTF8 encoded in a all model subclasses
Sequel::Model.plugin :force_encoding, 'UTF-8'

Sequel::Model.plugin :input_transformer
Sequel::Model.add_input_transformer(:to_nil){|v| v.is_a?(String) && v == '' ? nil : v}

# Auto-manage created_at/updated_at fields
Sequel::Model.plugin :timestamps, :update_on_create => true

Sequel.extension :connection_validator
Sequel.extension :migration
Sequel.extension :core_extensions

class TestApp
  SEQUEL_DB = Sequel.connect($env['DATABASE_URL'], connect_timeout: 5, read_timeout: 8, write_timeout: 5) unless defined? SEQUEL_DB

  configure :development do
    require_relative '../lib/pretty_logger'
    SEQUEL_DB.loggers << PrettyLogger.logger
  end
end

Sequel::Migrator.check_current(TestApp::SEQUEL_DB, './db/migrate') unless Dir['./db/migrate/*'].empty?
