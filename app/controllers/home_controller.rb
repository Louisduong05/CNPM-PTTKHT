class HomeController < ApplicationController
	def index
    @products = Product.all.length
    @suppliers = Supplier.all.length
    @pays = Pay.all.length
    @exports = Export.all.length
    @imports = Import.all.length
    @customers = Customer.all.length
  end
end