class WallpaperMenuController
  
  attr_writer :menu
  
  def awakeFromNib
	  @repository = WallpaperRepository.new
	  initialize_menu()
  end
  
  def next_wallpaper(sender)
    @menu.wallpaper = @repository.next
  end
  
  def initialize_menu
    @status_item = NSStatusBar.systemStatusBar.statusItemWithLength(30.0)
    @status_item.setTitle("WM")
    @status_item.setMenu(@menu)
    @status_item.setHighlightMode(true)
  end
  
end