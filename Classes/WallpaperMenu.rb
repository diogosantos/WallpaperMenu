class WallpaperMenu < NSMenu
  
  attr_writer :navigator_view
  attr_accessor :delegate
  
  def awakeFromNib
    configure_menu()
  end
  
  def configure_menu()
    @menuItem = self.itemAtIndex(0)
    @menuItem.setView( @navigator_view )
    
    @navigator_view.delegate = self
  end
  
  def wallpapers=(wallpapers)
    @navigator_view.wallpapers=wallpapers
  end
  
  def wallpaper_clicked(wallpaper)
    puts "Asking the controller for download the wallpaper"    
    @delegate.download_wallpaper(wallpaper)
  end
  
end