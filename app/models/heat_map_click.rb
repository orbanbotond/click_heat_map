class HeatMapClick < ActiveRecord::Base
#  belongs_to :heatMapUrl, :class_name => "HeatMapUrl", :foreign_key => "heat_map_url_id"
  belongs_to :heatMapUrl
end
