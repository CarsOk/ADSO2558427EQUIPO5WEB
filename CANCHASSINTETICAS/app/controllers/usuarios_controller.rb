class UsuariosController < ApplicationController
    before_action :authenticate_usuario!
    before_action :verificar_admin, only: :index

    def index
      @usuarios = Usuario.all
    end 

    def mis_reservas
      @usuario_reservas = current_usuario # O cualquier lógica para obtener el usuario actual
      @reservas = @usuario_reservas.reservas
    end

    def profile
      @usuario = Usuario.find(params[:id])
      @reservas_realizadas = @usuario.reservas.count
      @comentarios_realizados = @usuario.comentarios.count
    end

    def destroy
      begin
        @usuario = Usuario.find(params[:id])
        if @usuario.destroy
          respond_to do |format|
            format.html { redirect_to root_path, notice: "Reserva cancelada exitosamente" }
          end
        else
          set_flash_now_alert
          render :show
        end
      end
    end

    private

    def verificar_admin
      if current_usuario.admin == false
        flash[:alert] = "Sin permisos de administrador"
        redirect_back(fallback_location: root_path)
      end
    end
end
