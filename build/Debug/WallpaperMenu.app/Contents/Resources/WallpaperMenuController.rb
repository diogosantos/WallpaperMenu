class WallpaperMenuController
  
  attr_writer :menu
  
  def awakeFromNib
	@status_item = NSStatusBar.systemStatusBar.statusItemWithLength(30.0)
    @status_item.setTitle("WM")
    @status_item.setMenu(@menu)
    @status_item.setHighlightMode(true)
  end
  
end