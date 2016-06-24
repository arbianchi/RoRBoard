class CommentsController < ApplicationController
  before_action :set_post, except: [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    # @comment = current_user.comments.new(comment_params)    # authorize @comment
    @comment = @post.comments.new(user_id: current_user.id)  
  end


  def create
    @comment = @post.comments.new comment_params
    # authorize @comment
    if @comment.save
      flash[:notice] = "commented!"
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def show
    @comment = comment.find(params[:id])
    # authorize @comment
  end

  def set_post
    @post = Post.find(params[:post_id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:title, :content,:user_id)
  end
end
