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

  def calendario
    @cancha = Cancha.find(params[:cancha_id])

    if @cancha.nil?
      flash[:alert] = 'Cancha no encontrada.'
      redirect_to root_path
      return
    end

    @eventos = @cancha.reservas&.map do |reserva|
      {
        id: reserva.id,
        title: "#{reserva.hora_inicio.strftime('%I:%M %p')} - #{reserva.hora_fin.strftime('%I:%M %p')}",
        start: reserva.fecha.strftime('%Y-%m-%dT%H:%M:%S'),
        end: reserva.fecha.strftime('%Y-%m-%dT%H:%M:%S')
      }
    end || []

    puts "DEBUG: Cancha ID: #{params[:id]}"
    puts "DEBUG: Cancha: #{@cancha.inspect}"
    puts "DEBUG: Reservas: #{@eventos.inspect}"
  end

  def show
    @cancha = Cancha.find(params[:id])
    @reservas = Reserva.where("fecha >= ?", Date.today)
    @precio_cancha = @cancha.precio_ajustado
    @eventos = @cancha.reservas.map { |reserva| { id: reserva.id, title: 'Reservado', start: reserva.fecha.strftime('%Y-%m-%dT%H:%M:%S') } }
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
  
    def create
      @cancha = Cancha.new(cancha_params)
      if @cancha.save
        redirect_to cancha_path(@cancha), notice: "Cancha creada correctamente."
      else
        set_flash_now_alert
        render :new
      end
    end

    def destroy
      @cancha = Cancha.find(params[:id])
  
      begin
        if @cancha.destroy
          respond_to do |format|
            format.html { redirect_to canchas_path, notice: "Cancha eliminada exitosamente" }
          end
        else
          set_flash_now_alert
          render :show
        end
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
        redirect_back(fallback_location: root_path)
      end
    end
  
    def set_cancha
      @cancha = Cancha.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      # Redirigir a una página de error 404 si la Cancha no se encuentra
      flash[:alert] = 'Cancha no encontrada.'
      redirect_to root_path
    end

end