class CanchasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :verificar_admin, only: [:new, :edit, :destroy]

  def index
    @canchas = Cancha.all
  end

  def new
    @cancha = Cancha.new
  end

  def create
    @cancha = Cancha.new(cancha_params)
    if @cancha.save
      redirect_to cancha_path(@cancha), notice: "Cancha creada correctamente."
    else
      flash.now[:alert] = "Error al crear nueva cancha."
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
      redirect_to cancha_path(@cancha), notice: "Cancha editada correctamente."
    else
      flash.now[:alert] = "Error al editar la cancha."
      render :edit
    end
  end

  def destroy
    @cancha = Cancha.find(params[:id])
    if @cancha.destroy
    redirect_to cancha_path, notice: "Cancha eliminado correctamente."
    else 
      flash.now[:alert] = "Error al eliminar la cancha."
      render :new
    end   
  end

  private

  def cancha_params
    params.require(:cancha).permit(:codigo, :nombre, :jugadores, :distancia, :precio)
  end

  def verificar_admin
    if current_usuario.admin == false
      flash[:alert] = "Sin permisos de administrador"
      redirect_to dashboard_path
    end
  end
end
