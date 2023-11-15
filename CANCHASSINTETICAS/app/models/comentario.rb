class Comentario < ApplicationRecord
  belongs_to :valoracion
  belongs_to :usuario
end
