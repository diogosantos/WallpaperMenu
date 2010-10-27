class WallpaperMenuController
  
  attr_writer :menu, :navigator
  
  def awakeFromNib
	  initialize_wallpapers()
	  initialize_navigator()
	  initialize_menu()
  end
  
  def initialize_wallpapers
    @wallpaper_client = InterfaceLiftClient.new(self)
	  @wallpaper_client.get_wallpapers
  end
  
  def initialize_navigator
    @navigator.delegate = self
    item = @menu.itemAtIndex(0)
    item.setView( @navigator )
  end
  
  def initialize_menu
	  @status_item = NSStatusBar.systemStatusBar.statusItemWithLength(30.0)
    @status_item.setTitle("WM")
    @status_item.setMenu(@menu)
    @status_item.setHighlightMode(true)
  end
  
  def action_next(sender)
    @navigator.navigate_next
  end 
  
  def action_previous(sender)
    @navigator.navigate_previous
  end 
  
  def clientDidSucceed(wallpapers)
    puts "#{wallpapers.length} wallpapers reveived"
    @navigator.wallpapers = wallpapers
  end
  
  def wallpaper_clicked(wallpaper)
    path = "#{NSHomeDirectory()}/Pictures/#{NSDate.date().timeIntervalSinceReferenceDate()}.jpg"
  	Downloader.new(self).download(wallpaper.original_url, path)
  	@menu.cancelTracking
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