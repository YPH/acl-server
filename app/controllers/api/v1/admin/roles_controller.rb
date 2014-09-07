class Api::V1::Admin::RolesController < Api::V1::BaseController
  def index
    user = User.find_by(token: params[:token])
    if user.can(:read, "roles")
      roles = Role.all

      render json: {
        status: 0,
        data: roles
      }
    else
      render json: {
        status: -100
      }
    end
  end
end