class CommentsController < ApplicationController
  before_action :set_post, except: [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(user_id: current_user.id)    
    authorize @comment
  end


  def create
    @comment = Comment.new(comment_params)
    # authorize @comment
    if @comment.save
      flash[:notice] = "Commented!"
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find params[:id]
    authorize @comment
  end

  def update
    @comment = Comment.find params[:id]
    authorize @comment
    if @comment.update comment_params
      flash[:notice] = "Comment updated!"
      redirect_to @comment.post
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    authorize @comment
    if @comment.delete
      flash[:notice] = "Post deleted!"
      redirect to @comment.post
    else
      redirect_to @comment.post
    end
  end

  def show
    @comment = comment.find(params[:id])
    # authorize @comment
  end

  private

  def set_post
    @post = Post.find(params[:post_id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:post_id, :content,:user_id)
  end
end
