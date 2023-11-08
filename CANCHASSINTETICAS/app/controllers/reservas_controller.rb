class ReservasController < ApplicationController

  before_action :authenticate_usuario!
  before_action :verificar_admin, only: :index

  def index
    @reservas = Reserva.all
  end

  def new
    @reserva = Reserva.new
    @titulo = 'Realiza tu reserva'
  end

  def create
    @reserva = Reserva.new(reserva_params)
    if @reserva.save
      redirect_to reserva_path(@reserva), notice: "Reserva creada correctamente."
    else
      flash.now[:alert] = "Error al crear nueva reserva."
      render :new
    end
  end

  def show
    @reserva = Reserva.find(params[:id])
  end

  def edit
    @reserva = Reserva.find(params[:id])
    @titulo = 'Modificar reserva'
  end

  def update
    @reserva = Reserva.find(params[:id])
    if @reserva.update(reserva_params)
      redirect_to reserva_path(@reserva), notice: "Reserva editada correctamente."
    else
      flash.now[:alert] = "Error al editar la reserva."
      render :edit
    end
  end

  def destroy
    @reserva = Reserva.find(params[:id])
    if @reserva.destroy
    redirect_to reserva_path, notice: "Reserva eliminada correctamente."
    else 
      flash.now[:alert] = "Error al eliminar la reserva."
      render :new 
    end   
  end

  private

  def reserva_params
   params.require(:reserva).permit(:codigo, :fecha, :hora_inicio, :hora_fin, :cliente_id, :cancha_id)
  end

  def verificar_admin
    if current_usuario.admin == false
      flash[:alert] = "Sin permisos de administrador"
      redirect_to dashboard_path
    end
  end
end
