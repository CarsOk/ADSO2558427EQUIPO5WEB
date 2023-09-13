class CanchasController < ApplicationController
  def index
    @canchas = Cancha.all 
  end

  def new
    @cancha = Cancha.new
  end
  def create
    
    @cancha = Cancha.new(cancha_params)
    if @cancha.save
      redirect_to cancha_path(@cancha)
    else
      render :new
    end
  end
  def show
    @cancha = Cancha.find(params[:id])
  end

  def edit
    @cancha = Cancha.find(params[:id])
  end
  def update
    @cancha = Cancha.find(params[:id])
    if @cancha.update(cancha_params)
      redirect_to cancha_path(@cancha)
    else 
      render :edit
    end
  end

  private
  def cancha_params
    params.require(:cancha).permit(:nombre, :tamanio)
  end

end
