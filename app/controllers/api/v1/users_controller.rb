class Api::V1::UsersController < Api::V1::BaseController
  def index
    user = User.find_by(token: params[:token])
    if user.can(:read, "Users")
      @users = User.all

      render json: {
        status: 0,
        data: @users
      }
    else
      render json: {
        status: -100
      }
    end
  end

  def show
    @pages = User.first.pages
    
    render json: {
      status: 0,
      data: @pages.to_json
    }
  end

  def create
    if !User.where(username: params[:user][:username]).empty?
      render json: {
        status: -99
      }
    else
      user = User.create(
        username: params[:user][:username],
        password: Digest::MD5.new.hexdigest(params[:user][:password])
      )

      if user
        render json: {
          status: 0,
          data: user
        }
      else
        render json: {
          status: -100
        }
      end
    end
  end
end