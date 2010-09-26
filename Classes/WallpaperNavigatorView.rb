class WallpaperNavigatorView < NSView
  
  attr_writer :wallpaper_view
  
  def awakeFromNib
    @wallpapers = []
    reset_calls()
  end
  
  def wallpapers=(wallpapers)
    @wallpapers.concat(wallpapers)
  end
  
  def jump_next(sender)
    @wallpaper_view.display_wallpaper( next_wallpaper() )
  end
  
  def mouseDown(sender)  
    if wallpaper_clicked?(sender) then
       puts "click!"
    end    
  end
  
  def wallpaper_clicked?(sender)
    NSPointInRect(adjust_click_location(sender.locationInWindow), @wallpaper_view.bounds)
  end
  
  def adjust_click_location(point)    
    point.x = point.x - 6
    point.y = point.y - 54
    return point
  end
  
  def next_wallpaper
    return Wallpaper.wallpaper_default unless received_wallpapers?
    
    if more_wallpapers_to_call? then
      w = @wallpapers[@calls]
      increment_calls()
      return w
    else
      puts "No more wallpapers to display."
      reset_calls()
      return @wallpapers[0]
    end
  end
  
  def reset_calls
    @calls = 0;
  end
  
  def received_wallpapers?
    ! @wallpapers.empty?
  end
  
  def more_wallpapers_to_call?
    @wallpapers.length > @calls
  end
  
  def increment_calls
    @calls = @calls + 1
  end
  
  def jump_previous(sender)
    puts "previous clicked..."
  end
  
end