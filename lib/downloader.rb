class Downloader < Connection
  
  def initialize(delegate)
    @delegate = delegate
  end
 
  def download(original_url, destination_path)
    @destination_path = destination_path
    
  	get(original_url)
  	puts "Downloading..."
  end
  
  def connectionDidFailWithError(error)
    puts error.localizedDescription()
  end

  def connectionDidFinishLoading(content)
    if @status_code == 200 && @buffer.length > 0 then
    		save()
    		@delegate.downloadDidFinish(@destination_path)
    else
    		puts "Server responded with #{@status_code}"
    end
  end
  
  def save()
    puts "Saving #{@request_url.description()} to #{@destination_path}"
    @buffer.writeToFile(@destination_path, atomically:false)
  end

end