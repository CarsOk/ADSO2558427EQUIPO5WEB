class ReservasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :verificar_admin, only: :index
  before_action :set_usuario_current, only: [:new, :create]

  def index
    @reservas = Reserva.all
    @reservas.each(&:calcular_estado)
  end

  def new
    @reserva = Reserva.new
    @titulo = 'Realiza tu reserva'
  end

  def create
    @reserva = Reserva.new(reserva_params)
    @reserva.hora_inicio = params[:reserva][:hora_inicio]
    @reserva.hora_fin = params[:reserva][:hora_fin]
    @reserva.cancha_id = params[:reserva][:cancha_id]
    if @reserva.save
      ConfirmacionMailer.reserva(@reserva).deliver_now
      EnviarRecordatorioJob.set(wait_until: @reserva.fecha_recordatorio.to_datetime).perform_later(@reserva.id)
      redirect_to reserva_path(@reserva), notice: 'Reserva creada exitosamente.'
    else
      set_flash_now_alert
      render :new
    end
  end

  def show
    @reserva = Reserva.find(params[:id])
    @usuario = @reserva.usuario
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
      EditarMailer.reserva_modificada(@reserva).deliver_now
      
      EnviarRecordatorioJob.set(wait_until: @reserva.fecha_recordatorio.to_datetime).perform_later(@reserva.id)
      redirect_to reserva_path(@reserva), notice: "Reserva editada correctamente."
    else
      set_flash_now_alert
      render :edit
    end
  end

  def destroy
    @reserva = Reserva.find(params[:id])

    begin
      if @reserva.destroy
        respond_to do |format|
          format.html { redirect_to reservas_path, notice: "Reserva cancelada exitosamente" }
        end
      else
        set_flash_now_alert
        render :show
      end
    end
  end

  def seguridad_salud
    # No necesitas lógica adicional para esta vista
  end

  private

  def reserva_params
   params.require(:reserva).permit(:fecha, :hora_inicio, :hora_fin, :precio, :estado,:usuario_id, :cancha_id)
  end

  def verificar_admin
    if current_usuario.admin == false
      flash[:alert] = "Sin permisos de administrador"
      redirect_back(fallback_location: root_path)
    end
  end

  def set_flash_now_alert
    flash.now[:alert] = @reserva.errors.full_messages.join(', ')
  end

  def set_usuario_current
    @usuario_current = current_usuario
  end 
end
