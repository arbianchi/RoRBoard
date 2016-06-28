class BoardsController < ApplicationController
  # before_action except: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def new
    @board = Board.new
    authorize @board
  end

  def index
    @boards = Board.all
  end

  def create
    @board = Board.new(topic: params[:board][:topic])
    authorize @board
    if @board.save
      flash[:notice] = "Board created!"
      redirect_to @board
    else
      render :new
    end
  end

  def show
    @board = Board.find params[:id]
    authorize @board
  end

  def destroy
    board = current_user.boards.find params[:id]
    authorize board
    board.destroy
    redirect_to "/boards"
  end

  private

  # def set_board
  #   @board = Board.find(params[:board_id])
  # end

end
