class AdminregistrationController < Devise::SessionsController
	layout "admin_login"

# Custom devise Method for sing out path 
# --------------------------------------------------------------------- 
 
	 def after_sign_out_path_for(resource_or_scope) 
     admin_root_path     
     end

# Custom devise Method for sing in path 
# --------------------------------------------------------------------- 
 
      def after_sign_in_path_for(resource_or_scope) 
     admin_root_path     
     end

end
