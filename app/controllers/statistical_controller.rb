class StatisticalController < ApplicationController
  def index
    @products = Product.where(is_active: true)
  end
end