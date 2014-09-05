class Api::V1::SessionsController < Api::V1::BaseController
  def index
    render json: {status: 0}
  end

  def create
    user = User.where(username: params[:user][:username], password: params[:user][:password]).first

    render json: {
      status: 0,
      data: user
    }

    #user = nil

    #if params[:user] && params[:user][:username]
    #  user = User.where(username: params[:user][:username]).first
    #end

    #if user
    #  render json: user.to_json
    #else
    #  render json: {error: -1}
    #end
  end

  def destroy
  end
end