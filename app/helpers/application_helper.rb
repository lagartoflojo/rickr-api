module ApplicationHelper

  def image_url(path)
    request.protocol + request.host_with_port + path
  end 

end
