class PostsController < ApplicationController

  def index
    @posts  = Post.all  
  end

  def new
    @post = Post.new
    @categories = Category.all.map{|c| [c.name, c.id]}
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @post = Post.new(post_params)
    @post.category_id = params[:category_id]
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }  
      end
    end  
  end

  def show
   @post = Post.where(id: params[:id]).first
    render_404 unless @post
  end

  def update
    @post = Post.find(params[:id])
    @post.category_id = params[:category_id]
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_url, notice: 'post was successfully updated.' }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end  
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def find_post
    @post = Post.where(id: params[:id]).first
    render_404 unless @post
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

end
