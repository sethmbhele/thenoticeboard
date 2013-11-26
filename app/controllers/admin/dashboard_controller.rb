class Admin::DashboardController < Admin::BaseController
  
 
 
# Method for index
# --------------------------------------------------------------------- 
 
  def index
   @user_sign_up_count = User.where("DATE(created_at) = ?", Date.today)

  end

end