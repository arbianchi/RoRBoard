class PostsController < ApplicationController
  before_action :set_board, except: [:destroy, :new, :edit, :update, :show] 
  def index
    @posts = Post.all
  end

  def new
    @board = Board.find(params[:board_id])
    @post = @board.posts.new user_id: current_user.id
    authorize @post
  end

  def create
    @board = Board.find(params[:board_id])
    @post = @board.posts.new post_params
    authorize @post
    if @post.save
      flash[:notice] = "Posted!"
      redirect_to @board
    else
      render :new
    end
  end

  def edit
    @post = Message.find(params[:id])
    @board = @post.board
    authorize @post
  end

  def update
    @post = Message.find(params[:id])
    authorize @post
    if @post.update post_params
      flash[:notice] = "Post updated!"
      redirect_to @post.board
    else
      render :edit
    end
  end

  def destroy
    @post = Message.find(params[:id])
    authorize @post
    if @post.delete
      flash[:notice] = "Post deleted!"
      redirect_to @post.board
    else
      render "board/show"
    end
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end
  
  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content,:user_id)
  end
end
