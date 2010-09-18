require 'Connection'

class Client < Connection
  
  def initialze(delegate)
    super(self)
    @delegate = delegate    
    @error = nil
  end
  
  def get_wallpapers
    get( url() )
  end
  
  def connectionDidFailWithError(error)
    delegate.clientDidFail( self, error:error.localizedDescription() );
  end

  def connectionDidFinishLoading(content)
    if @status_code == 200 && @buffer.length > 0 then
    		document = NSXMLDocument.alloc.initWithData(@buffer, options:NSXMLDocumentTidyHTML, error:@error)
    		wallpapers = parse_document(document)
    		@delegate.clientDidSucceed(wallpapers)
    else
    		@delegate.clientDidFail(self, error:"Server responded with #{@status_code}")
    end
  end
  
  def url()
    
  end
  
  def parse_document(document)
    
  end
  
end