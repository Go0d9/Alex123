class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if current_user && current_user.admin?    
      @comment.commenter = "AlexFlush"
    else
      @comment.commenter = current_user.email
    end
    @comment.save
    respond_to do |format|
      format.html {redirect_to post_path(@post), notice: 'Comment was successfully create.' }
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Comment was successfully deleted.' }
      format.js
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:commenter , :body, :post_id)
  end
end