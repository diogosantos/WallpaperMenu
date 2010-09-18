class WallpaperNavigatorView < NSView
  
  attr_writer :wallpaper_view
  
  def awakeFromNib
    @wallpapers = []
    @calls = 0
  end
  
  def wallpapers=(wallpapers)
    @wallpapers.concat(wallpapers)
  end
  
  def jump_next(sender)
    @wallpaper_view.display_wallpaper( next_wallpaper() )
  end
  
  def next_wallpaper
    return Wallpaper.wallpaper_default unless received_wallpapers?
    
    if more_wallpapers_to_call? then
      w = @wallpapers[@calls]
      increment_call()
      return w
    else
      puts "No more wallpapers to display."        
      return @wallpapers[0]
    end
  end
  
  def received_wallpapers?
    ! @wallpapers.empty?
  end
  
  def more_wallpapers_to_call?
    @wallpapers.length > @calls
  end
  
  def increment_call
    @calls = @calls + 1
  end
  
  def jump_previous(sender)
    puts "previous clicked..."
  end
  
end