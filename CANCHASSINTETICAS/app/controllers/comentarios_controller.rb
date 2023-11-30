class ComentariosController < ApplicationController
  
  def index
    @comentarios = Comentario.all
  end

  def new
    @comentario = Comentario.new
  end

  def create
    @comentario = Comentario.new(comentario_params)
    if @comentario.save
      redirect_to comentarios_path, notice: "Comentario agregado exitosamente."
    else
      set_flash_now_alert
      render :new  # or redirect back to the form with an error message
    end
  end
  
  def edit
    @comentario = Comentario.find(params[:id])
  end

  def update
    @comentario = Comentario.find(params[:id])
    if @comentario.update(comentario_params)
      redirect_to comentarios_path, notice: "Comentario editado correctamente."
    else
      set_flash_now_alert
      render :edit
    end
  end
  private
    def comentario_params
      params.require(:comentario).permit(:calificacion, :contenido, :tipo, :usuario_id)
    end

    def set_flash_now_alert
      flash.now[:alert] = @comentario.errors.full_messages.join(', ')
    end
end



