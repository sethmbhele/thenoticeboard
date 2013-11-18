class Admin::UserController < Admin::BaseController
  
  # User listing
  # --------------------------------------------------------------------- 
 
  def index
  	@user = User.order('created_at DESC')
  end

  # User new action
  # --------------------------------------------------------------------- 
  
	def new
	    @user = User.new   
	end


# Method for create user 
# --------------------------------------------------------------------- 
 
	def create
	    @header="Add User"
	    @user = User.new(params[:user])

	    respond_to do |format|
	      if @user.save
	        @user.add_role  :"#{params[:name][:role]}" unless params[:name][:role].blank?
	        format.html { redirect_to admin_user_index_path, notice: 'New User added successfully'}
	      else
	         format.html {
	           render :new
	           }
	      end
	    end
	end

# User Edit method and dispaying role for a user 
# --------------------------------------------------------------------- 

  def edit
      @user = User.find(params[:id])
      @role = @user.roles
      @role_all = Role.all
      @role_except = Role.find(:all, :conditions=> ['id not in (?)', @role.pluck(:id) ]) 
  end
 

 # User update method
 # --------------------------------------------------------------------- 
  
 def update
    @user = User.find(params[:id])

  	@user.update_attributes(params[:user])
  
     #Deactivate user roles
  	 #---------------------------------------
     if params[:deactive_role_ids]
  	 	params[:deactive_role_ids].each do |t|
         @user.remove_role  :"#{t}" 
        end 
     end
    
    #activate user role
    #----------------------------------------
 
     if params[:active_role_ids]
  	 	params[:active_role_ids].each do |t|
         @user.add_role  :"#{t}" 
        end 
     end

  respond_to do |format|
      format.html {  redirect_to admin_user_index_path(@user), notice: 'User updated successfully .'
}
    end


end


# User delete method
# --------------------------------------------------------------------- 

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_user_index_path, notice: 'User deleted successfully.'}
    end
  end

end
