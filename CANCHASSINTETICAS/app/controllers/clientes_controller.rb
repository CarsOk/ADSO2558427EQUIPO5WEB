class ClientesController < ApplicationController
  before_action :verificar_admin, only: :index

  def index
    @clientes = Cliente.all
  end

  def new
    @cliente = current_usuario.build_cliente
    @titulo = 'Registrarse'
  end

  def create
    @cliente = current_usuario.build_cliente(cliente_params)
    if @cliente.save
      redirect_to cliente_path(@cliente), notice: "Cliente creado correctamente."
    else
      flash.now[:alert] = "Error al crear nuevo cliente."
      render :new
    end
  end

  def show
    @cliente = Cliente.find(params[:id])
    @reservas_realizadas = @cliente.reservas.count
  end

  def edit
    @cliente = Cliente.find(params[:id])
    @titulo = 'Modificar información'
  end

  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update(cliente_params)
      redirect_to cliente_path(@cliente), notice: "Cliente editado correctamente." 
    else
      lse 
      flash.now[:alert] = "Error al editar el cliente."
      render :edit
    end
  end

  def destroy
    @cliente = Cliente.find(params[:id])
    if @cliente.destroy
    redirect_to cliente_path, notice: "Cliente eliminado correctamente."
    else 
      flash.now[:alert] = "Error al eliminar el cliente."
      render :new
    end   
  end

  private

  def cliente_params
    params.require(:cliente).permit(:identificacion, :nombre, :apellido, :email, :usuario_id)
  end

  def verificar_admin
    if current_usuario.admin == false
      flash[:alert] = "Sin permisos de administrador"
      redirect_to dashboard_path
    end
  end
end
