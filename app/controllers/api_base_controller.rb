class ApiBaseController < ActionController::Base
  skip_forgery_protection

  def success_response(data: [], message: "", status: :ok)
    render json: { data: data, message: message }, status: status
  end

  def error_response(message: "", status: :unprocessable_entity)
    render json: { message: message }, status: status
  end
end