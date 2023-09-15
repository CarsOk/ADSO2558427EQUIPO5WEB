class FacturasController < ApplicationController
  def index
    @facturas= Factura.all
 end

 def new
    @factura = Factura.new
 end

 def show
    @factura= Factura.find(params[:id])
 end

 def create
    @factura= Factura.new(factura_params)
    if @factura.save
     redirect_to factura_path(@factura)
    else 
     render :new
    end
 end

 def edit
    @factura = Factura.find(params[:id])
 end

 def update
   @factura = Factura.find(params[:id])
    if @factura.update(factura_params)
     redirect_to factura_path(@factura)
    else
     render :edit
    end 
 end

 private 
 def factura_params 
   params.require(:factura).permit(:codigo, :fecha, :hora, :id_cliente, :id_cancha)
 end
end
