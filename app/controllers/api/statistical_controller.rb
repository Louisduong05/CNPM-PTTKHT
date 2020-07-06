class Api::StatisticalController < Api::BaseController
  def index
    data = StatisticalService.call(params[:to_date], params[:from_date])
    render json: data, status: 200
  end
end