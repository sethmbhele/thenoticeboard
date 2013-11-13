class ApplicationController < ActionController::Base
  protect_from_forgery




  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private


  def after_sign_in_path_for(resource_or_scope)
    profile_index_path
   end
end
