class Usuarios::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_usuario!
  layout "login", only: [:new, :set_flash_now_alert]
  before_action :verificar_admin, only: :index

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      BienvenidoMailer.usuario(@usuario).deliver_now
       sign_in(@usuario)

      flash[:notice] = "Se ha creado su usuario exitosamente."

      redirect_to after_sign_up_path_for(@usuario)
    else
      flash[:alert] = "Datos ingresados no validos"
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @usuario = current_usuario
    @reservas_realizadas = @usuario.reservas.count
    @comentarios_realizados = @usuario.comentarios.count
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

  def destroy
    begin
      @usuario = current_usuario
      if @usuario.destroy
        respond_to do |format|
          format.html { redirect_to root_path, notice: "Cuenta eliminada exitosamente" }
        end
      else
        set_flash_now_alert
        render :show
      end
    end
  end

    private

    def usuario_params
      params.require(:usuario).permit(:identificacion, :nombre, :apellido, :email, :password, :password_confirmation, :imagen)
    end

    def after_sign_up_path_for(usuario)
      # Especifica la ruta a la que quieres redirigir después del registro exitoso.
      dashboard_path
    end

    def set_flash_now_alert
      flash.now[:alert] = @usuario.errors.full_messages.join(', ')
      if @usuario.nil?
        flash.now[:alert] = "Se produjo un error y el usuario es nulo."
      else
        flash.now[:alert] = @usuario.errors.full_messages.join(', ')
      end
    end

    def verificar_admin
      if current_usuario.admin == false
        flash[:alert] = "Sin permisos de administrador"
        redirect_back(fallback_location: root_path)
      end
    end
end
