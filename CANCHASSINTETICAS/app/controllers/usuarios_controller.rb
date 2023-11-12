class UsuariosController < ApplicationController
    before_action :authenticate_usuario!
    before_action :verificar_admin, only: :index
  
    def index
      @usuarios = Usuario.all
    end
    
    def verificar_admin
        if current_usuario.admin == false
          flash[:alert] = "Sin permisos de administrador"
          redirect_to dashboard_path
        end
    end
end