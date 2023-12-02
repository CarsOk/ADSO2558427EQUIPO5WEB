class Cancha < ApplicationRecord
has_many :reservas

default_scope { order(:id) }

mount_uploader :image, ImageUploader

    def precio_ajustado
        if fin_de_semana?
          precio + 10000
        else
          precio
        end
    end
      
    def precio_finde
      precio + 10000
    end

  private 

  def fin_de_semana?
    hoy = Date.today
    hoy.saturday? || hoy.sunday?
  end
end
