class ComentariosController < ApplicationController

  def index
    @comentarios = Comentario.all
  end

  def new
    @comentario = Comentario.new
  end

  def create
    @comentario = Comentario.new(comentario_params)
    @comentario.usuario = current_usuario

    if @comentario.save
      redirect_to comentarios_path, notice: "Comentario agregado exitosamente."
    else
      set_flash_now_alert
      render :new
    end
  end

  private
    def comentario_params
      params.require(:comentario).permit(:usuario_id, :calificacion, :tipo, :contenido)
    end

    def set_flash_now_alert
      flash.now[:alert] = @comentario.errors.full_messages.join(', ')
    end
end
