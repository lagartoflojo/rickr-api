class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_api_key

  def check_api_key
    if request.format.json?
      unless Usuario.find_by_api_key params[:api_key]
        head :forbidden
      end
    end
  end

end
