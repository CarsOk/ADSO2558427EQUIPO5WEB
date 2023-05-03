class UsersController < ApplicationController
  def index
    users = User.all
  end

  def new
    user = User.new
  end
    def create
      @user = User.new
      if @user.save
        redirect_to user_path(@user)
      else 
        render :new
    end
  end

  def show
    user = user.find(params[:id])
  end

  def edit
    user = user.find(params[:id])
  end

  private
  def user_params
    params.requier(:user).permit(:identificacion, :nombre, :apellido, :telefonos)
  end 
end
