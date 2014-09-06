class Api::V1::CalendarsController < Api::V1::BaseController
  def index
    begin
      user = User.find_by(token: params[:token])
      calendar = user.calendar

      render json: {
        status: 0,
        data: calendar.as_json
      }
    rescue
      render json: {
        status: -100
      }
    end
  end
end