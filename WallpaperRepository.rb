class WallpaperRepository

  def initialize
    @client = InterfaceLift.new(self)
    @client.get_wallpapers
    
    @wallpaperCalls = 0
    @wallpapers = []
    puts has_received_wallpapers()
  end

  def next
    unless has_received_wallpapers() then
      puts "Wallpapers not received yet."
      return Wallpapers.wallpaper_default()      
    end

    if has_more_wallpapers() then
      @wallpaperCalls = @wallpaperCalls + 1
      return @wallpapers[@wallpaperCalls]
    else
      puts "No more wallpapers to display."
      return @wallpapers[0]
    end
  end
  
  def has_received_wallpapers
    ! @wallpapers.empty?
  end

  def has_more_wallpapers
    @wallpapers.length > @wallpaperCalls
  end
  
  def clientDidSucceed(wallpapers)
    puts "#{wallpapers.length} wallpapers reveived."
    @wallpapers.concat(wallpapers)
  end
  
  def clientDidFail(sender, error:error)
    
  end
  
end