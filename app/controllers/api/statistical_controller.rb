class Api::StatisticalController < Api::BaseController
  def index
    data = StatisticalService.call(params)
    render json: data, status: 200
  end
end