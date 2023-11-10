class HomeController < ApplicationController
  layout "application", except: [:landing_page]
  before_action :authenticate_usuario!, only: [:dashboard]

  def dashboard
    @cantidad_canchas = Cancha.all.size
    @cantidad_clientes = Cliente.all.size
  end

  def landing_page
    render layout: false
  end
end
