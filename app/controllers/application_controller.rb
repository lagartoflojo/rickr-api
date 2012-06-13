class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_filter :verify_authenticity_token, if: :is_api_request?
  before_filter :authenticate_api

  private
  def authenticate_api
    if request.format.json?
      unless Usuario.find_by_api_key params[:api_key]
        head :forbidden
        return false
      end
    end
  end

  def is_api_request?
    request.format.json?
  end

end
