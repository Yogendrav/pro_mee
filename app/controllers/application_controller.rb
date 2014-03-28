class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :project_new_modal

  def project_new_modal
  	@project = Project.new
    @users = User.all
  end
end
