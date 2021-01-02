class AccountsController < ApplicationController
  load_and_authorize_resource class: "User" 

  def index
    @accounts = @accounts.order("id ASC").paginate(:page => params[:page], :per_page => 3)
  end

  def new; end

  def create
    if @account.save
      redirect_to accounts_path, notice: t('common.notice.save_success')
    else
      render 'new', notice: t('common.notice.save_errors')
    end
  end

  def show; end

  def edit; end

  def update
    if @account.update account_params
      redirect_to accounts_path, notice: t('common.notice.save_success')
    else
      render 'edit', notice: t('common.notice.save_errors')
    end  
  end

  def destroy
    pre_is_active = @account.is_active
    if @account.update(is_active: !pre_is_active)
      redirect_to accounts_path, notice: t('common.notice.save_success')
    else
      render 'index', notice: t('common.notice.save_errors')
    end
  end

  private

  def account_params
    data = params.require(:user).permit(:email, :password, :username, :firstname, :lastname, :dob, :phone, :address, :type)

    data.delete(:password) if params[:user][:password].blank?
    
    data
  end
end