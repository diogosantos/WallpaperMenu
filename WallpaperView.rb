class WallpaperView < NSView
  
  def awakeFromNib
    self.wallpaper = Wallpaper.wallpaper_default()
  end
  
  def wallpaper=(wallpaper) 
    @wallpaper = wallpaper
    @image = NSImage.alloc.initWithData( @wallpaper.thumbnail_url.resourceDataUsingCache(false) )
  end
  
  def drawRect(rect)
    @image.drawInRect( make_rect(), fromRect: image_rect(), operation:NSCompositeCopy, fraction:1.0 )
  end
  
  def make_rect
    NSMakeRect( bounds().origin.x + 5,  bounds().origin.y + 10, frame().size.width - 10, frame().size.height - 10)
  end
  
  def image_rect
    NSMakeRect(0,0, @image.size.width, @image.size.height)
  end
  
end