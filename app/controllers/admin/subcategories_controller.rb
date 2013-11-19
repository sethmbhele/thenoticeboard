class Admin::SubcategoriesController < Admin::BaseController
 
  #----------------------------------------------------------------------
  # Method for listing subcategory
  # --------------------------------------------------------------------- 
 
  def index

    # if(params[:search])    
    #     session[:sub_cat_name] = params[:search][:name_contains]
    #      session[:sub_page]=1
    # end
    # if(session[:sub_cat_name])
    #    params[:search]={}
    #  params[:search][:name_contains] = session[:sub_cat_name] 

    # end

    # if(params[:page])
    #   session[:sub_page]=params[:page]   
    # end
    # unless(session[:sub_page])  
    #   session[:sub_page]=1
    # end 


    @search = Subcategory.search(params[:search]) 
    @subcategories =  @search.paginate(:page => params[:page], :per_page => 5,:order => 'created_at DESC')



    # @subcategories = Subcategory.paginate(:page => params[:page], :per_page => 20,:order => 'name ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subcategories }
    end
  end

 #--------------------------------------------------------------------------
 # Method for show subcategory
 # ------------------------------------------------------------------------- 
 
  def show
    @subcategory = Subcategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subcategory }
    end
  end

  #---------------------------------------------------------------------------
  # Method for initializing subcategory object
  # --------------------------------------------------------------------- 
 
  def new
    @subcategory = Subcategory.new
    @category    = Category.order('name asc')
    @questions   = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subcategory }
    end
  end

  #----------------------------------------------------------------------
  # Method for edit subcategory
  # --------------------------------------------------------------------- 
 
  def edit
 
    @subcategory = Subcategory.find(params[:id])
     @category = Category.order('name asc')
  end

  #-----------------------------------------------------------------------
  # Method for create subcategory
  # --------------------------------------------------------------------- 
 
  def create
    @subcategory = Subcategory.new(params[:subcategory])
     @category = Category.order('name asc')
    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to admin_subcategories_url, notice: 'Subcategory was successfully created.' }
        format.json { render json: @subcategory, status: :created, location: @subcategory }
      else
        format.html { render action: "new" }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  #-----------------------------------------------------------------------
  # Method for update subcategory
  # --------------------------------------------------------------------- 
 
  def update
    @subcategory = Subcategory.find(params[:id])
     @category = Category.order('name asc')
    respond_to do |format|
      if @subcategory.update_attributes(params[:subcategory])
        format.html { redirect_to admin_subcategories_url, notice: 'Subcategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  #--------------------------------------------------------------------------
  # Method for delete subcategory
  # ------------------------------------------------------------------------- 
 
  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.destroy

    respond_to do |format|
      format.html { redirect_to admin_subcategories_url, notice: 'Subcategory was successfully deleted.'  }
      format.json { head :no_content }
    end
  end

  #--------------------------------------------------------------------------
  # Method for cahange status
  # ------------------------------------------------------------------------- 
 
  def change_status
    @subcategory = Subcategory.find(params[:id])
    
    respond_to do |format|
    if  @subcategory.status == true
        @subcategory.update_attribute(:status,'FALSE')
    else
        @subcategory.update_attribute(:status,'TRUE')
    end 
     
        format.html { redirect_to admin_subcategories_url, notice:'Subcategory was successfully updated.' }        
    end
  end

end