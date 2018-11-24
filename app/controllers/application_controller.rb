class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

	before_action :authenticate_user!
  before_action :update_notification_status

  layout :layout_by_resource

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end

  def update_notification_status
    if(params[:n]) 
      Notification.where(id: params[:n]).limit(1).update_all(read: true)
    end
  end
end
