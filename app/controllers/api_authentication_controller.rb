class ApiAuthenticationController < ApplicationController
  skip_before_filter :authenticate_api

  def create
    if @user = Usuario.login(params[:user_name], params[:password])
      logger.info @user.inspect
      respond_to do |format|
        format.json { render json: { api_key: @user.api_key } }
      end
    else
      head :forbidden
    end
  end

end
