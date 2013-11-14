class ApplicationController < ActionController::Base
  protect_from_forgery




  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

 def after_update_path_for(resource)
      profile_path
    end
  private


  def after_sign_in_path_for(resource_or_scope)
    profile_path
   end


end
