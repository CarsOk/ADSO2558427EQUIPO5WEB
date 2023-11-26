class ComentariosController < ApplicationController
  def index
    @comentario = Comentario.all
    @comentario = Comentario.new
    render :index
end

  end

  def create
    @comentario = Comentario.new(comentario_params)
    if @comentario.save
      redirect_to comentario_path(@comentario), notice: "Comentario agregado exitosamente."
    else
      set_flash_now_alert
      render :new
  end
  end
  def new
    @comentario = Comentario.new
  end

  def edit
    @comentario = Comentario.find(params[:id])
  end

  def update
    @comentario = Comentario.find(params[:id])
    if @comentario.update(comentario_params)
      redirect_to comentario_path(@comentario), notice: "Comentario editado correctamente."
    else
      set_flash_now_alert
      render :edit
    end
  end
  private
  def comentario_params
    params.require(:comentario).permit(:calificacion, :contenido)
    end

    def set_flash_now_alert
      flash.now[:alert] = @comentario.errors.full_messages.join(', ')
  end



