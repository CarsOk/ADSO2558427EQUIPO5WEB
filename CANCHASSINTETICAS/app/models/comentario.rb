class Comentario < ApplicationRecord
  belongs_to :usuario

  validates :usuario_id, :calificacion, :tipo, :contenido, presence: true
end
