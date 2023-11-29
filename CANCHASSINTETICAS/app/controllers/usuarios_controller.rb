class UsuariosController < ApplicationController
    before_action :authenticate_usuario!
    before_action :verificar_admin, only: :index

  
    def index
      @usuarios = Usuario.all
      respond_to do |format|
        format.html {render :index}
        format.json { render json: @usuarios } # Responderá en formato JSON si la solicitud lo solicita explícitamente
      end
    end

    def mis_reservas
      @usuario_reservas = current_usuario # O cualquier lógica para obtener el usuario actual
      @reservas = @usuario_reservas.reservas
    end

    private

    def verificar_admin
        if current_usuario.admin == false
          flash[:alert] = "Sin permisos de administrador"
          redirect_to dashboard_path
        end
    end

end