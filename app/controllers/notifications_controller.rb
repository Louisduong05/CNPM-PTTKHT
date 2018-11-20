class NotificationsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def seen
    current_user.notifications.where(read: false).update_all(read: true)

    render json: { success: true }
  end
end