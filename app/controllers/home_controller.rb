class HomeController < ApplicationController
	def index
    @products = Product.all.length
    @suppliers = Supplier.all.length
    @brands = Brand.all.length
    @exports = Export.all.length
    @imports = Import.all.length
    @users = User.all.length
  end
end