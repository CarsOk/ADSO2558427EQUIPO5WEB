class CanchasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :verificar_admin, only: [:new, :edit, :destroy]

  def index
    @canchas = Cancha.all
  end

  def new
    @cancha = Cancha.new
    @titulo = 'Ingresar nueva cancha'
  end

  def create
    @cancha = Cancha.new(cancha_params)
    if @cancha.save
      redirect_to cancha_path(@cancha), notice: "Cancha creada correctamente."
    else
      set_flash_now_alert
      render :new
    end
  end

  def show
    @cancha = Cancha.find(params[:id])
    @reservas = Reserva.where("fecha >= ?", Date.today)
    @precio_cancha = @cancha.precio_ajustado
  end

  def edit
    @cancha = Cancha.find(params[:id])
    @titulo = 'Modificar Cancha'
  end

  def update
    @cancha = Cancha.find(params[:id])
    if @cancha.update(cancha_params)
      redirect_to cancha_path(@cancha), notice: "Cancha editada correctamente."
    else
      set_flash_now_alert
      render :edit
    end
  end

  def destroy
    @cancha = Cancha.find(params[:id])
    if @cancha.destroy
    redirect_to cancha_path, notice: "Cancha eliminado correctamente."
    else 
      set_flash_now_alert
      render :new
    end   
  end

  private

  def cancha_params
    params.require(:cancha).permit(:codigo, :nombre, :jugadores, :distancia, :precio, :image)
  end

  def set_flash_now_alert
    flash.now[:alert] = @canchas.errors.full_messages.join(', ')
  end

  def verificar_admin
    if current_usuario.admin == false
      flash[:alert] = "Sin permisos de administrador"
      redirect_to dashboard_path
    end
  end

end
