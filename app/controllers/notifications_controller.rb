class NotificationsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: { success: true }
  end

  def seen
    current_user.notifications.where(read: false).update_all(read: true)

    render json: { success: true }
  end

  def show_all
    @notifications = Notification.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 3)
  end
end