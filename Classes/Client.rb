require 'connection'

class Client < Connection
  
  def initialze(delegate)
    super(self)
    @delegate = delegate    
    @error = Pointer.new_with_type('@')
  end
  
  def get_wallpapers
    get( url() )
  end
  
  def connectionDidFailWithError(error)
    puts error.localizedDescription()
  end

  def connectionDidFinishLoading(content)
    if @status_code == 200 && @buffer.length > 0 then
    		document = NSXMLDocument.alloc.initWithData(@buffer, options:NSXMLDocumentTidyHTML, error:@error)
    		wallpapers = parse_document(document)
    		@delegate.clientDidSucceed(wallpapers)
    else
    		puts "Server responded with #{@status_code}"
    end
  end
  
  def url()
    
  end
  
  def parse_document(document)
    
  end
  
end