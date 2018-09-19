class AccountsController < ApplicationController
  def index
    @accounts = User.all
  end

  def new
    @account = User.new
  end

  def create
    @account = User.new account_params

    if @account.save
      redirect_to accounts_url, notice: "Luu thanh cong"
    else
      render 'new'
    end 
  end

  private

  def account_params
    params.require(:user).permit(:email, :password, :username, :firstname, :lastname, :dob, :phone, :address)
  end
end