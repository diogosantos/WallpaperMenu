class WallpaperMenuController
  
  attr_writer :menu
  
  def awakeFromNib
	  @wallpaper_client = InterfaceLiftClient.new(self)
	  @wallpaper_client.get_wallpapers
	  @downloader = Downloader.new(self)
	  
	  initialize_menu()
  end
  
  def initialize_menu
    @status_item = NSStatusBar.systemStatusBar.statusItemWithLength(30.0)
    @status_item.setTitle("WM")
    @status_item.setMenu(@menu)
    @status_item.setHighlightMode(true)
    
    @menu.delegate = self
  end
  
  def clientDidSucceed(wallpapers)
    puts "#{wallpapers.length} wallpapers reveived from InterfaceLift.com"
    @menu.wallpapers = wallpapers
  end
  
  def clientDidFail(sender, error:error)
    puts "InterfaceLift.com has failed."
  end
  
  def download_wallpaper(wallpaper)    
    path = "/Users/diogo/Pictures/#{NSDate.date().timeIntervalSinceReferenceDate()}.jpg"
  	      	
  	@downloader.download(wallpaper.original_url, path)
  end

  def downloadDidFinish(path)
    file = NSURL.fileURLWithPath(path)
    set_file_as_wallpaper(file)	
  end
  
  def set_file_as_wallpaper(file)
    error = Pointer.new_with_type('@')
  	options = NSDictionary.dictionaryWithObjectsAndKeys(NSNumber.numberWithBool(false), NSWorkspaceDesktopImageAllowClippingKey, NSNumber.numberWithInteger(NSImageScaleProportionallyUpOrDown), NSWorkspaceDesktopImageScalingKey, nil)
  	wallpaper_setted = NSWorkspace.sharedWorkspace.setDesktopImageURL(file, forScreen:NSScreen.screens.lastObject(), options:options, error:error)
  	puts "Error: #{error.localizedDescription()}" unless wallpaper_setted
  end
  
end