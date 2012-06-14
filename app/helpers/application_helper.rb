module ApplicationHelper

  def asset_url(asset_path)
    request.protocol + request.host_with_port + asset_path
  end
end
