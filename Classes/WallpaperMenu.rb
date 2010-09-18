class WallpaperMenu < NSMenu
  
  attr_writer :navigator_view
  
  def awakeFromNib
    configure_menu()
  end
  
  def configure_menu()
    @menuItem = self.itemAtIndex(0)
    @menuItem.setView( @navigator_view )
  end
  
  def wallpapers=(wallpapers)
    @navigator_view.wallpapers=wallpapers
  end
  
end