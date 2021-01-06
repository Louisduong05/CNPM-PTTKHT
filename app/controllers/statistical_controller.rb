class StatisticalController < ApplicationController
  def index
    @products = Product.all
  end
end