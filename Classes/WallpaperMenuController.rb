class WallpaperMenuController
  
  attr_writer :menu
  
  def awakeFromNib
	  @wallpaper_client = InterfaceLiftClient.new(self)
	  @wallpaper_client.get_wallpapers
	  
	  initialize_menu()
  end
  
  def initialize_menu
    @status_item = NSStatusBar.systemStatusBar.statusItemWithLength(30.0)
    @status_item.setTitle("WM")
    @status_item.setMenu(@menu)
    @status_item.setHighlightMode(true)
  end
  
  def clientDidSucceed(wallpapers)
    puts "#{wallpapers.length} wallpapers reveived from InterfaceLift.com"
    @menu.wallpapers = wallpapers
  end
  
  def clientDidFail(sender, error:error)
    puts "InterfaceLift.com has failed."
  end
  
end