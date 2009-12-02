class ClickHeatMapGenerator < Rails::Generator::NamedBase
  
  @@clickMigrationName = "CreateHeatMapClick"
  @@clickTableName = "HeatMapClick"

  @@urlMigrationName = "CreateHeatMapUrl"
  @@urlTableName = "HeatMapUrl"

  def manifest
    record do |m|
      # m.directory "lib"
      # m.template 'README', "README"
      
      m.migration_template 'model:migration.rb', 'db/migrate', {:assigns => assigns_4_clicks,
        :migration_file_name => normalize( @@clickMigrationName)
      }

      m.migration_template 'model:migration.rb', 'db/migrate', {:assigns => assigns_4_url,
        :migration_file_name => normalize( @@urlMigrationName)
      }

    end
  end
  
private

  def normalize( name)
    file_name = name.underscore.downcase
    file_name = file_name.pluralize if ActiveRecord::Base.pluralize_table_names
  end

  def assigns_4_clicks
    returning(assigns = {}) do
      assigns[:table_name] = normalize( @@clickTableName)
      assigns[:migration_name] = ActiveRecord::Base.pluralize_table_names ? @@clickMigrationName.pluralize : @@clickMigrationName
      assigns[:attributes] = [Rails::Generator::GeneratedAttribute.new("x", "integer")]
      assigns[:attributes] << Rails::Generator::GeneratedAttribute.new("y", "integer")
      assigns[:attributes] << Rails::Generator::GeneratedAttribute.new(normalize( @@urlTableName), "integer")
    end
  end

  def assigns_4_url
    returning(assigns = {}) do
      assigns[:table_name] = normalize( @@urlTableName)
      assigns[:migration_name] = ActiveRecord::Base.pluralize_table_names ? @@urlMigrationName.pluralize : @@urlMigrationName
      assigns[:attributes] = [Rails::Generator::GeneratedAttribute.new("url", "string")]
    end
  end  
end
