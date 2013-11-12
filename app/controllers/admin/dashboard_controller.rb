class Admin::DashboardController < Admin::BaseController
  before_filter :check_option
  #before_filter :authenticate_adminuser!
 def check_option
    @option='1'
  end

  def index
   
   end
end