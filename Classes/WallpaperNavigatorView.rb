class WallpaperNavigatorView < NSView

  attr_writer :wallpaper_view
  attr_accessor :delegate

  def awakeFromNib 
    @wallpapers = []
    @calls = -1
  end

  def wallpapers=(wallpapers)
    @wallpapers.concat(wallpapers)
  end

  def mouseDown(sender)  
    if wallpaper_clicked?(sender)
      puts "Wallpaper Clicked"
      @delegate.wallpaper_clicked( @current_wallpaper )
    end    
  end

  def wallpaper_clicked?(mouse)
    NSPointInRect(adjust_click_location(mouse.locationInWindow), @wallpaper_view.bounds)
  end

  def adjust_click_location(point)    
    point.x = point.x - 6
    point.y = point.y - 54
    return point
  end

  def display_next
    unless received_wallpapers?
      @current_wallpaper = Wallpaper.wallpaper_default 
    end

    increment_calls()
    @current_wallpaper = @wallpapers[@calls]
    display_current_wallpaper()
  end

  def increment_calls
    if still_has_wallpapers_to_display?
      @calls = @calls + 1            
    else
      puts "No more wallpapers to display."
      @calls = 0
    end
  end

  def display_current_wallpaper
    puts "Current wallpaper index = #{@calls}"
    @wallpaper_view.display_wallpaper(@current_wallpaper)
  end

  def still_has_wallpapers_to_display?
    @wallpapers.length > ( @calls + 1 )
  end

  def received_wallpapers?
    ! @wallpapers.empty?
  end

end