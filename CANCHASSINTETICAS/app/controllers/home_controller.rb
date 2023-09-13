class HomeController < ApplicationController
  before_action :authenticate_user!
  def dashboard
    @cantidad_canchas = Cancha.all.size
    @cantidad_clientes = Cliente.all.size
  end
end
