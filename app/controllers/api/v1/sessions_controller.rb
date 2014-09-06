class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user = User.where(
      username: params[:user][:username],
      password: Digest::MD5.new.hexdigest(params[:user][:password])).first

    if user
      Authenticate.sign_in(user)
      
      render json: {
        status: 0,
        data: user
      }
    else
      render json: {
        status: -1
      }
    end
  end

  def destroy
  end
end