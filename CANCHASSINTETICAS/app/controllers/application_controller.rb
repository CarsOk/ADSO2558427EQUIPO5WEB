class ApplicationController < ActionController::Base
  helper_method :actual

  def actual
    @usuario_current = current_usuario
  end

end
