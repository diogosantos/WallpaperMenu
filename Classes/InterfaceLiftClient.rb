class InterfaceLiftClient < Client
  
  def initialize(delegate)
    super(delegate)
  end
  
  def url
    "http://interfacelift.com/wallpaper_beta/downloads/date/widescreen/1440x900/"
  end

  def parse_document(document)
    wallpapers = []

    thumbnails = document.rootElement().nodesForXPath("//div[@class='preview']/a/img", error:@error);		
    thumbnails.each { |thumbnail|
      wallpapers << Wallpaper.new(NSURL.URLWithString( thumbnail.attributeForName("src").stringValue ) )
    }

    originals = document.rootElement().nodesForXPath("//div[@class='preview']/div[@class='download']/div", error:@error)    
    wallpapers.each_index { |i|
      html_div = originals[i]
      html_a = html_div.elementsForName("a")[0]

      w = wallpapers[i]
      w.original_url = NSURL.URLWithString("http://interfacelift.com#{ html_a.attributeForName("href").stringValue }")
      wallpapers[i] = w
    }

    return wallpapers;
  end
  
end