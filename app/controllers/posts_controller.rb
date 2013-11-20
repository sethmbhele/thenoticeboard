class PostsController < ApplicationController
  
  # Method for post listing all posts
  # --------------------------------------------------------------------- 
 
  def index
    @posts = Post.order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end

  end

 #-----------------------------------------------------------------------
 # Method for search 
 #-----------------------------------------------------------------------
 def search 
  if params[:name] 
   @posts =  Post.joins(:subcategory).where(:zip => params[:zip]).where('subcategories.name ilike?', params[:name])
  end
 end 

  #----------------------------------------------------------------------
  # Methods for listing indivisual post
  #----------------------------------------------------------------------
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
 
  #----------------------------------------------------------------------------
  # Method for new post
  #----------------------------------------------------------------------------
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  #----------------------------------------------------------------------------
  # Method for Edit post 
  #----------------------------------------------------------------------------

  def edit
    @post = Post.find(params[:id])
  end

  #--------------------------------------------------------------------------------
  # Method for creating new posts
  # --------------------------------------------------------------------------------
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render json: posts_path, status: :created, location: posts_path }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # --------------------------------------------------------------------------------
  # Methods for creating update 
  # --------------------------------------------------------------------------------
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # --------------------------------------------------------------------------------
  # Method for delete the posts
  # --------------------------------------------------------------------------------

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
