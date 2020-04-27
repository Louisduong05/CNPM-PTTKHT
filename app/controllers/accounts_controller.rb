class AccountsController < ApplicationController
  load_and_authorize_resource class: "User" 

  def index; end

  def new; end

  def create
    if @account.save
      redirect_to accounts_path, notice: "Luu thanh cong"
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @account.update account_params
      redirect_to accounts_path, notice: "Cap nhat thanh cong"
    else
      render 'edit', notice: "Cap nhat that bai"
    end  
  end

  def destroy
    @account.destroy
    redirect_to accounts_path, notice: "Xoa thanh cong"
  end

  private

  def account_params
    data = params.require(:user).permit(:email, :password, :username, :firstname, :lastname, :dob, :phone, :address, :type)

    data.delete(:password) if params[:user][:password].blank?
    
    data
  end
end