require 'test/unit'

framework 'Cocoa'
require 'classes/Wallpaper'
require 'classes/Connection'
require 'classes/Client'
require 'classes/InterfaceLiftClient'

class InterfaceLiftTest < Test::Unit::TestCase
  
  def setup    
    error = Pointer.new_with_type('@')    
    @parser = InterfaceLiftClient.new(self)    
    fileManager = NSFileManager.new
    data = fileManager.contentsAtPath("tests/InterfaceLift.html")
    @document = NSXMLDocument.alloc.initWithData(data, options:NSXMLDocumentTidyHTML, error:error)
  end
  
  def test_parse_documents
    wallpapers = @parser.parse_document( @document )
	  
	  wallpaper = Wallpaper.new( NSURL.URLWithString("http://interfacelift.com/wallpaper_beta/previews/02373_beautifulwinter.jpg") )
	  wallpaper.original_url = NSURL.URLWithString("http://interfacelift.com/wallpaper_beta/grab/2373_beautifulwinter_1440x900.jpg")
	  
	  assert_equal wallpaper, wallpapers[0]
  end
  
end