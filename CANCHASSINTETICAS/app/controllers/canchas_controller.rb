class CanchasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :verificar_admin, only: [:new, :edit]

  def index
    @canchas = Cancha.all

#    if current_usuario.admin
#      @canchas = Cancha.all
#    else
#      flash[:alert] = "Sin permisos"
#      redirect_to dashboard_path
#    end
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
    params.require(:cancha).permit(:codigo, :nombre, :tamaño, :precio)
  end

  def verificar_admin
    if current_usuario.admin == false
      flash[:alert] = "Sin permisos de administrador"
      redirect_to dashboard_path
    end
  end
end
