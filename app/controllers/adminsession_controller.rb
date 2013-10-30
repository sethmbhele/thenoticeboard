class AdminsessionController < Devise::RegistrationsController
layout "admin_login"

def after_sign_in_path_for(resource)
     admin_root_path  
end

end
