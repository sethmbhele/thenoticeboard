class Admin::CategoriesController < Admin::BaseController
  # GET /categories
  # GET /categories.json
 before_filter :check_option

 def check_option
    @option='2'
  end

  def index

    # if(params[:search])    
    #     session[:sub_cat] = params[:search][:name_contains]
    #    session[:cat_page]=1
    # end
    # if(session[:sub_cat])
    #    params[:search]={}
    #  params[:search][:name_contains] = session[:sub_cat] 
    # end

    # if(params[:page])
    #   session[:cat_page]=params[:page]   
    # end
    # unless((session[:cat_page])&&(!session[:sub_cat]))     
    #   session[:cat_page]=1
    # end 

     #@categories = .all
     @search = Category.search(params[:search]) 
    # @categories =  @search.paginate(:page => session[:cat_page], :per_page => 5,:order => 'created_at DESC')
  

    @categories = @search.paginate(:page => params[:page], :per_page => 20,:order => 'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])

  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_url, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to admin_categories_url, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to admin_categories_url,notice: 'Category was successfully deleted.'}
      format.json { head :no_content }
    end
  end

   def change_status
    @category = Category.find(params[:id])
    
    respond_to do |format|
    if  @category.status == true
        @category.update_attribute(:status,'FALSE')
    else
        @category.update_attribute(:status,'TRUE')
    end 
     
        format.html { redirect_to admin_categories_url, notice:'Category was successfully updated.' }        
   
    end
  end
end