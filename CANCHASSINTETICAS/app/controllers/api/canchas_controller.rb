class Api::CanchasController < ApplicationController

  def index
    @canchas = Cancha.all
    render json: @canchas
  end

end
