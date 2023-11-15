class Usuarios::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_usuario!
  layout "login", only: [:new]
  before_action :verificar_admin, only: :index

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      sign_in(@usuario)
      redirect_to new_usuario_session_path
      flash[:notice] = "Se ha creado su usuario exitosamente."
    else
      flash.now[:alert] = "Error al crear su usuario."
      render :new
    end
  end
  
  def show
    @usuario = current_usuario
  end

  def edit
    @usuario = current_usuario
  end
 
  def update
    @usuario = current_usuario
    if @usuario.update(usuario_params)
      redirect_to user_profile_path, notice: "Se actualizado el perfil correctamente."
    else
      flash.now[:alert] = "Error al editar su perfil."
      render :edit
    end
  end

  
    private
  
    def sign_up_params
      params.require(:usuario).permit(:identificacion, :nombre, :apellido, :email, :password, :password_confirmation)
    end
    
    def usuario_params
      params.require(:usuario).permit(:identificacion, :nombre, :apellido, :email, :password, :password_confirmation)
    end

    def verificar_admin
      if current_usuario.admin == false
        flash[:alert] = "Sin permisos de administrador"
        redirect_to dashboard_path
      end
    end

    def after_sign_up_path_for(resource)
      new_session_path(resource) # o la ruta que desees después del registro
    end
end
