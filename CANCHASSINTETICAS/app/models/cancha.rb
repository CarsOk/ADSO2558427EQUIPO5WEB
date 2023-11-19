class Cancha < ApplicationRecord
has_many :reservas
has_and_belongs_to_many :usuarios

mount_uploader :image, ImageUploader

    def precio_ajustado
        if fin_de_semana?
          precio + 10000
        else
          precio
        end
      end
      

  private 

  def fin_de_semana?
    hoy = Date.today
    hoy.saturday? || hoy.sunday?
  end
end
