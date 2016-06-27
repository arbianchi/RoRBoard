class ModeratorsController < ApplicationController
  def index
    @mods = Moderator.order(:board_id)
    authorize @mods
  end

  def new
    @board = Board.find params[:board][:board_id]
    @mod = @board.moderators.new
    authorize @mod
  end

  def create
    @user = User.find_by(name: params[:moderator][:user])
    if @user.nil?
      flash[:alert] = "No user by that name!"
      redirect_to :back
    else
      @mod = Moderator.new(board_id: params[:moderator][:board_id], user_id: @user.id)
      authorize @mod
      if @mod.save
        flash[:notice] = "Moderator assigned!"
        redirect_to @mod.board
      else
        render :new
      end
    end
  end

  def destroy
    @mod = Moderator.find params[:id]
    authorize @mod
    if @mod.delete
      flash[:notice] = "Moderator removed!"
      redirect_to moderators_path
    else
      flash[:notice] = "Moderator not unassigned!"
      redirect_to moderators_path
    end
  end

  private

  def approved_params
    params.require(:moderator).permit(:user, :board_id)
  end
end
