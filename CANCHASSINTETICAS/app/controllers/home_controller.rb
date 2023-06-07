class HomeController < ApplicationController
  def dashboard
    @cantidad_canchas = Cancha.all.size
    @cantidad_clientes = Cliente.all.size
  end
end
