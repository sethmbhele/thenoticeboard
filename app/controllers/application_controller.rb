class ApplicationController < ActionController::Base
  protect_from_forgery
 # before_filter :authenticate_user!
 before_filter :set_cache_buster

# Method for to prevent browsers from caching a page 
# --------------------------------------------------------------------- 
 
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

# Exception Method of cancan
# --------------------------------------------------------------------- 
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end


private
# Custom devise update Method for user
# ---------------------------------------------------------------------  
    def after_update_path_for(resource)
      profile_path
    end
  



# Exception Method of cancan
# --------------------------------------------------------------------- 
 
  def after_sign_in_path_for(resource_or_scope)
    profile_path
   end


end
