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
  
  def eql?(wallpaper)
    self.class.eql?(wallpaper.class) &&
      @thumbnail_url.description == wallpaper.thumbnail_url.description &&
      @original_url.description == wallpaper.original_url.description
  end  
  
  def to_s
    "[Thumbnail=#{@thumbnail_url.description}, Original=#{@original_url.description}]"
  end
  
  alias description to_s

  alias == eql?
  
end