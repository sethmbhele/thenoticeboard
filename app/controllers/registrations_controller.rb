class RegistrationsController < Devise::RegistrationsController


  
  protected

# Devise methods  for redirection thank you page
#----------------------------------------------------------------------------------------------------------------------------------

  
  # def after_sign_up_path_for(resource)
  #   # the page new users will see after sign up (after launch, when no invitation is needed)
  #   redirect_to root_path
  # end
  
  # def after_sign_out_path_for(resource_or_scope) 
  #   root_path
  # end


end