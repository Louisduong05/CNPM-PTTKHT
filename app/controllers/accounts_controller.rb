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
      redirect_to accounts_path, notice: "Luu thanh cong"
    else
      render 'new'
    end 
  end

  def show
    @account = User.find(params[:id])
  end

  def edit
    @account = User.find(params[:id])
  end

  def update
    @account = User.find(params[:id])

    if @account.update account_params
      redirect_to accounts_path, notice: "Cap nhat thanh cong"
    else
      render 'edit', notice: "Cap nhat that bai"
    end  
  end

  def destroy
    @account = User.find(params[:id])
    @account.destroy
    redirect_to accounts_path, notice: "Xoa thanh cong"
  end

  private

  def account_params
    params.require(:user).permit(:email, :password, :username, :firstname, :lastname, :dob, :phone, :address, :type)
  end
end