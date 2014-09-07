class Api::V1::PermissionsController < Api::V1::BaseController
  def index
    begin
      user = User.find_by(token: params[:token])
      code = user.permission_on(params[:resource_name])

      render json: {
        status: 0,
        permission_code: code
      }
    rescue
      render json: {
        status: -100,
        permission_code: 0
      }
    end
  end

  def show
    begin
      user = User.find_by(token: params[:token])
      resource = Kernel.const_get(params[:resource_name]).find(params[:id])
      code = user.permission_on(resource)
      render json: {
        status: 0,
        permission_code: code
      }
    rescue
      render json: {
        status: -100,
        permission_code: 0
      }
    end
  end
end