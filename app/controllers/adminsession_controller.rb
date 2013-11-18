class AdminsessionController < Devise::RegistrationsController
layout "admin_login"

# Devise custom Methods for admin sign 
#------------------------------------------------------------------------------------
	def after_sign_in_path_for(resource)
    	 admin_root_path  
	end

# Devise custom Methods admin update path
#------------------------------------------------------------------------------------

  	def after_update_path_for(resource)
         admin_root_path
 	end

end
