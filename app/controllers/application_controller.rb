class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

# Exception Method of cancan
# --------------------------------------------------------------------- 
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

# Custom devise update Method for user
# ---------------------------------------------------------------------  
    def after_update_path_for(resource)
      profile_path
    end
  

private

# Exception Method of cancan
# --------------------------------------------------------------------- 
 
  def after_sign_in_path_for(resource_or_scope)
    profile_path
   end


end
