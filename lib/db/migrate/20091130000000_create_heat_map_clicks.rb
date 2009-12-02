class CreateHeatMapClicks < ActiveRecord::Migration
  def self.up
    create_table :heat_map_clicks do |t|
      t.integer :x
      t.integer :y
      t.integer :heat_map_url_id

      t.timestamps
    end

    create_table :heat_map_urls do |t|
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :heat_map_clicks
    drop_table :heat_map_urls
  end
end
