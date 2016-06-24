class PostsController < ApplicationController
  before_action :set_post, except: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @board = Board.find(params[:board_id])
    @post = @board.posts.new user_id: current_user.id
    # authorize @post
  end

  def create
    @board = Board.find(params[:board_id])
    @post = @board.posts.new post_params
    # authorize @post
    if @post.save
      flash[:notice] = "Posted!"
      redirect_to @board
    else
      render :new
    end
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
    # authorize @post
  end

  def set_post
    @post = Post.find(params[:board_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content,:user_id, :board_id)
  end
end
