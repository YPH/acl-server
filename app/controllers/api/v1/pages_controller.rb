class Api::V1::PagesController < Api::V1::BaseController
  def index
    @pages = Page.all

    render json: {
      status: 0,
      data: @pages
    }
  end

  def show
    @page = Page.find(params[:id])

    render json: {
      status: 0,
      data: @page
    }
  end

  def create
    begin
      user = User.find_by(token: params[:token])
      user.pages.create(params[:page].permit(:title, :content))

      render json: {
        status: 0
      }
    rescue
      render json: {
        status: -100
      }
    end
  end

  def update
    user = User.find_by(token: params[:token])
    page = Page.find(params[:id])
    if user.can(:write, page)
      page.update_attributes(params[:page].permit(:title, :content))
      render json: {
        status: 0
      }
    else
      render json: {
        status: -100
      }
    end
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    
    render json: {
      status: 0
    }
  end

  def permit
    begin
      page= Page.find(params[:id])
      user = User.find_by(token: params[:token])
      code = user.permission_on(page)

      render json: {
        status: 0,
        permission_code: code
      }
    rescue
      render json: {
        status: -100
      }
    end
  end
end