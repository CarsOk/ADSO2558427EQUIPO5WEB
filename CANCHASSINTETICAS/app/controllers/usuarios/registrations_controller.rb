class Usuarios::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_usuario!
  layout "login", only: [:new]
  before_action :verificar_admin, only: :index

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      sign_in(@usuario)
      flash[:notice] = "Se ha creado su usuario exitosamente."
    else
      set_flash_now_alert
      render :new
    end
  end
  
  def show
    @usuario = current_usuario
    @reservas_realizadas = @usuario.reservas.count
  end

  def edit
    @usuario = current_usuario
  end
 
  def update
    @usuario = current_usuario
    if @usuario.update(usuario_params)
      redirect_to user_profile_path, notice: "Se actualizado el perfil correctamente."
    else
      set_flash_now_alert
      render :edit
    end
  end

  
    private
    
    def usuario_params
      params.require(:usuario).permit(:identificacion, :nombre, :apellido, :email, :password, :password_confirmation, :imagen)
    end

    def set_flash_now_alert
      flash.now[:alert] = @reserva.errors.full_messages.join(', ')
    end

    def verificar_admin
      if current_usuario.admin == false
        flash[:alert] = "Sin permisos de administrador"
        redirect_to dashboard_path
      end
    end
end
