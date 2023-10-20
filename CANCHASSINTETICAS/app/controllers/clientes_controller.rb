class ClientesController < ApplicationController

  def index
    @clientes = Cliente.all
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      redirect_to cliente_path(@cliente)
    else
      render :new
    end
  end

  def show
    @cliente = Cliente.find(params[:id])
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:id])
  end
  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update(cliente_params)
      redirect_to cliente_path(@cliente)
    else 
      render :edit
    end
  end

  private
  def cliente_params
    params.require(:cliente).permit(:identificacion, :nombre, :apellido, :telefono)
  end
end
