class ReservasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :verificar_admin, only: :index
  before_action :set_usuario_current, only: [:new, :create]

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
      redirect_to reserva_path(@reserva), notice: 'Reserva creada exitosamente.'
    else
      set_flash_now_alert
      render :new
    end
  end

  def show
    @reserva = Reserva.find(params[:id])
  end

  def edit
    @reserva = Reserva.find(params[:id])
    @usuario_current = current_usuario
    @titulo = 'Modificar reserva'
  end

  def update
    @reserva = Reserva.find(params[:id])
    @usuario_current = current_usuario
    if @reserva.update(reserva_params)
      redirect_to reserva_path(@reserva), notice: "Reserva editada correctamente."
    else
      set_flash_now_alert
      render :edit
    end
  end

  def destroy
    @reserva = Reserva.find(params[:id])
    if @reserva.destroy
    redirect_to reserva_path, notice: "Reserva eliminada correctamente."
    else 
      set_flash_now_alert
      render :new 
    end   
  end

  private

  def reserva_params
   params.require(:reserva).permit(:fecha, :hora_inicio, :hora_fin, :usuario_id, :cancha_id)
  end

  def verificar_admin
    if current_usuario.admin == false
      flash[:alert] = "Sin permisos de administrador"
      redirect_to dashboard_path
    end
  end

  def set_flash_now_alert
    flash.now[:alert] = @reserva.errors.full_messages.join(', ')
  end

  def set_usuario_current
    @usuario_current = current_usuario
  end
end
