class AccountsController < ApplicationController
  load_and_authorize_resource class: "User" 

  def index; end

  def new; end

  def create
    if @account.save
      redirect_to accounts_path, notice: t('common.notice.save_success')
    else
      render 'new', notice: t('common.notice.save_errors')
    end
  end

  def unactive
    @account.update(is_active: !@product.is_active)
    redirect_to products_path, notice: t('common.notice.save_success')
  end

  def show; end

  def edit; end

  def update
    if @account.update account_params
      redirect_to accounts_path, notice: t('common.notice.save_success')
    else
      render 'edit', notice: t('common.notice.save_success')
    end  
  end

  def destroy
    @account.destroy
    redirect_to accounts_path, notice: t('common.notice.save_success')
  end

  private

  def account_params
    data = params.require(:user).permit(:email, :password, :username, :firstname, :lastname, :dob, :phone, :address, :type)

    data.delete(:password) if params[:user][:password].blank?
    
    data
  end
end