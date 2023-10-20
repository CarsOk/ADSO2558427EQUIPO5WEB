class ReservasController < ApplicationController
  def index
    @reservas = Reserva.all
  end

  def new
    @reserva = Reserva.new
  end

  def create
    @reserva = Reserva.new(reserva_params)
    if @reserva.save
      redirect_to reserva_path(@reserva)
    else
      render :new
    end
  end

  def show
    @reserva = Reserva.find(params[:id])
  end

  def edit
    @reserva = Reserva.find(params[:id])
  end

  def update
    @reserva = Reserva.find(params[:id])
    if @reserva.update(reserva_params)
      redirect_to reserva_path(@reserva)
    else
      render :edit
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
