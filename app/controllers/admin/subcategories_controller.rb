class Admin::SubcategoriesController < Admin::BaseController
before_filter :check_option

 def check_option
    @option='3'
  end

  
  # GET /subcategories
  # GET /subcategories.json
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

  # GET /subcategories/1
  # GET /subcategories/1.json
  def show
    @subcategory = Subcategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subcategory }
    end
  end

  # GET /subcategories/new
  # GET /subcategories/new.json
  def new
    @subcategory = Subcategory.new
    @category = Category.order('name asc')
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subcategory }
    end
  end

  # GET /subcategories/1/edit
  def edit
 
    @subcategory = Subcategory.find(params[:id])
     @category = Category.order('name asc')
  end

  # POST /subcategories
  # POST /subcategories.json
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

  # PUT /subcategories/1
  # PUT /subcategories/1.json
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

  # DELETE /subcategories/1
  # DELETE /subcategories/1.json
  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.destroy

    respond_to do |format|
      format.html { redirect_to admin_subcategories_url, notice: 'Subcategory was successfully deleted.'  }
      format.json { head :no_content }
    end
  end

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