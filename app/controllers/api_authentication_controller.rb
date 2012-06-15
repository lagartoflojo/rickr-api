class ApiAuthenticationController < ApplicationController

  skip_before_filter :check_api_key

  def create
    if @user = Usuario.login(params[:user_name], params[:password])
      respond_to do |format|
        format.json
      end
    else
      head :forbidden
    end
  end

end
