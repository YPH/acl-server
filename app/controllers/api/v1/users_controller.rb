class Api::V1::UsersController < Api::V1::BaseController
  def index
    render json: {
      status: 0
    }
  end

  def show
    @pages = User.first.pages
    
    render json: {
      status: 0,
      data: @pages.to_json
    }
  end
end