class AdminregistrationController < Devise::SessionsController
	layout "admin_login"

	 def after_sign_out_path_for(resource_or_scope) 
     admin_root_path     
     end

      def after_sign_in_path_for(resource_or_scope) 
     admin_root_path     
     end

end
