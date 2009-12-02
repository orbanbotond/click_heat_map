class JavascriptsController < ActionController::Base
  def clickmap
      render :action => "clickmap.js"
  end
  
  def overlay
    url = params[:url]
    url = "http://orbankulcsoshaz.myhost/"
    @heatmap = "/images/" + HeatMapUrl.create_heatmap(url)
    @overlay_style = "<style type='text/css'>@import url('/stylesheets/click_heat_map.css');</style>"
    render :action => "overlay.js"    
  end

  def click
    pageClicks = HeatMapUrl.addClick(params[:url], params[:x], params[:y])
    render :text => ""
  end
end
