class Api::V1::CalendarsController < Api::V1::BaseController
  def index
    render json: {
      status: 0
    }
  end

  def show
    #http://192.168.109.195:3000/api/v1/calendars/54089f077562757c5e010000?token=dave

    calendar = Calendar.find(params[:id])
    user = User.where(token: params[:token]).first

    if user && user.can(:read, calendar)
      render json: {
        status: 0,
        data: calendar.to_json
      }
    else
      render json: {
        status: -1
      }
    end
  end

  def edit
    calendar = Calendar.find(params[:id])
    user = User.where(token: params[:token]).first
    
    if user && user.can(:write, calendar)
      render json: {
        status: 0,
        data: calendar.to_json
      }
    else
      render json: {
        status: -1
      }
    end
  end
end