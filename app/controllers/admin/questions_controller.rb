class Admin::QuestionsController < Admin::BaseController
 
  #----------------------------------------------------------------------
  # Method for listing questions
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


    @questions =  Question.paginate(:page => params[:page], :per_page => 20,:order => 'created_at DESC')


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

 #--------------------------------------------------------------------------
 # Method for show questions
 # ------------------------------------------------------------------------- 
 
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  #---------------------------------------------------------------------------
  # Method for initializing question object
  # --------------------------------------------------------------------- 
 
  def new
    @question       = Question.new
    #2.times { @question.subquestions.build }
    @subcategory    = Subcategory.order('name asc')
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  #----------------------------------------------------------------------
  # Method for edit question
  # --------------------------------------------------------------------- 
 
  def edit
 
    @question    = Question.find(params[:id])
    @subcategory = Subcategory.order('name asc')
  end

  #-----------------------------------------------------------------------
  # Method for create question
  # --------------------------------------------------------------------- 
 
  def create
     @question = Question.new(params[:question])
     @subcategory = Subcategory.order('name asc')
    respond_to do |format|
      if @question.save
        format.html { redirect_to admin_questions_url, notice: 'Question was successfully created.' }
        format.json { render json: questions_path, status: :created, location: questions_path }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  #-----------------------------------------------------------------------
  # Method for update Question
  # --------------------------------------------------------------------- 
 
  def update
    @question = Question.find(params[:id])
     @subcategory = Subcategory.order('name asc')
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to admin_questions_url, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  #--------------------------------------------------------------------------
  # Method for delete subcategory
  # ------------------------------------------------------------------------- 
 
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to admin_questions_url, notice: 'question was successfully deleted.'  }
      format.json { head :no_content }
    end
  end

  

end