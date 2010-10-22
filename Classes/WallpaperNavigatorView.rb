class WallpaperNavigatorView < NSView

  attr_writer :wallpaper_view, :previous_button, :next_button
  attr_accessor :delegate

  def awakeFromNib  
    @wallpapers = []
    @wallpaper_index = -1
    change_previous_button_status()
  end

  def wallpapers=(wallpapers)
    @wallpapers.concat(wallpapers)
    navigate_next()
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

  def navigate_previous
    decrement_wallpaper_index()
    update_navigator()
  end
  
  def decrement_wallpaper_index
    unless is_first_wallpaper?
      @wallpaper_index = @wallpaper_index - 1
    end
  end

  def navigate_next
    increment_wallpaper_index()
    update_navigator()
  end
  
  def update_navigator
    @current_wallpaper = @wallpapers[@wallpaper_index]
    change_buttons_state()
    display_current_wallpaper()
  end
  
  def increment_wallpaper_index
    unless is_last_wallpaper?
      @wallpaper_index = @wallpaper_index + 1    
    end
  end
  
  def change_buttons_state
    change_next_button_status()
    change_previous_button_status()
  end
  
  def change_next_button_status
    @next_button.setEnabled( !is_last_wallpaper? )
    @next_button.display
  end
  
  def is_last_wallpaper?
    (@wallpaper_index + 1) == @wallpapers.size
  end
  
  def change_previous_button_status
    @previous_button.setEnabled( !is_first_wallpaper? )    
    @previous_button.display
  end
  
  def is_first_wallpaper?
    @wallpaper_index <= 0
  end

  def display_current_wallpaper
    @wallpaper_view.display_wallpaper(@current_wallpaper)
  end

end