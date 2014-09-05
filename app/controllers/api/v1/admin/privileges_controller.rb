class Api::V1::Admin::PrivilegesController < Api::V1::BaseController
  def index
    user = User.where(token: params[:token])
    role = Role.where(name: "admin").first
    rr = ResourceRole.where(user: user, role: role).first

    access =  Privilege.where(
      role: role,
      action: "all",
      resource_name: "admin_panel"
    ).first

    if rr
      roles = Role.all
      render json: {
        status: 0,
        data: roles.to_json
      }
    else
      render json: {
        status: -1
      }
    end
  end

  def show
    @page = Page.first

    render json: {
      status: 0,
      data: @page.to_json
    }
  end

  def edit
    @page = Page.first
    
    render json: {
      status: 0,
      data: @page.to_json
    }
  end
end