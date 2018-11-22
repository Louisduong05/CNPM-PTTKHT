class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

	before_action :authenticate_user!

  layout :layout_by_resource

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end
end
