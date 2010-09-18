class WallpaperMenu < NSMenu
  
  attr_writer :wallpaper_view
  
  def awakeFromNib
    configure_menu()
  end
  
  def configure_menu()
    @menuItem = self.itemAtIndex(0)
    @menuItem.setView( @wallpaper_view )
  end
  
end