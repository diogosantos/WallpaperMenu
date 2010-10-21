class Connection
  
  def initialize(delegate)
    @delegate = delegate
  end
  
  def get(url)
    @buffer = NSMutableData.data
    @status_code = 0
    @request_url = url    
    @connection = NSURLConnection.alloc.initWithRequest( request(), delegate:self)
  end
  
  def request()
    request = NSMutableURLRequest.requestWithURL(@request_url,											 
    														     cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData,
    													   timeoutInterval:60.0)    
    return decorate_request(request)
  end
  
  def decorate_request(request)
    user_agent = "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us) AppleWebKit/534.1+ (KHTML, like Gecko) Version/5.0 Safari/533.16"
    request.setValue(user_agent, forHTTPHeaderField:"User-Agent")
    return request
  end
  
  def connection(connection, willSendRequest:request, redirectResponse:response)
    mutableRequest = request.mutableCopyWithZone(nil)
    return decorate_request(mutableRequest)
  end
  
  def connectionDidFinishLoading(connection)
    data = NSString.alloc.initWithData( @buffer.encoding( NSUTF8StringEncoding ) )
    connectionDidFinishLoading(data)
  end

  def connection(connection, didFailWithError:error)
    puts "Connection failed: #{error.localizedDescription()}"
    connectionDidFailWithError(error)
  end
  
  def connection(connection, didReceiveResponse:response)     
    if response then
      @status_code = response.statusCode
      puts "Response: #{@status_code}"
    end      
  	@buffer.setLength(0)
  end
  
  def connection(connection, didReceiveData:data)
  	@buffer.appendData(data)
  end

  def connectionDidFailWithError(error)
    
  end

  def connectionDidFinishLoading(content)
    
  end
  
end