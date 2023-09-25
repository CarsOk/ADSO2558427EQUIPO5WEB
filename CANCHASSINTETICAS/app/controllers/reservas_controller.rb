class ReservasController < ApplicationController
  def index
    @reservas = Reserva.all
  end

  def new
    @reservas = Reserva.new
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
   params.require(:reserva).permit(:codigo, :fecha, :hora_inicio, :hora_fin, :id_cancha, :id_cliente)
  end
end
