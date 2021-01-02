class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html {
        redirect_to root_path, notice: 'Bạn không có quyền vào trang này'
      }
    end
  end
  skip_before_action :verify_authenticity_token

	before_action :authenticate_user!
  before_action :update_notification_status
  before_action :set_locale

  layout :layout_by_resource

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end

  def update_notification_status
    if(params[:n]) 
      Notification.where(id: params[:n]).limit(1).update_all(read: true)
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def url_options
    { :locale => I18n.locale }.merge(super)
  end
end
