class WallpaperView < NSView
  
  def awakeFromNib
    display_wallpaper( Wallpaper.wallpaper_default )
  end
  
  def display_wallpaper(wallpaper)
    @image = NSImage.alloc.initWithData( wallpaper.thumbnail_url.resourceDataUsingCache(false) )
    display()
  end
  
  def drawRect(rect)
    @image.drawInRect( make_rect(), fromRect: image_rect(), operation:NSCompositeCopy, fraction:1.0 )
  end
  
  def make_rect
    NSMakeRect( bounds().origin.x,  bounds().origin.y, frame().size.width, frame().size.height)
  end
  
  def image_rect
    NSMakeRect(0,0, @image.size.width, @image.size.height)
  end
  
end