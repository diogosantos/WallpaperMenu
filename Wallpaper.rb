class Wallpaper
  
  attr_reader :thumbnail_url
  attr_accessor :original_url
  
  def initialize(thumbnail_url)
    @thumbnail_url = thumbnail_url
  end
  
  def Wallpaper.wallpaper_default()
    path = NSBundle.mainBundle.pathForResource("wallpaper", ofType:"jpg")
    Wallpaper.new( NSURL.fileURLWithPath( path  )  )
  end
  
end