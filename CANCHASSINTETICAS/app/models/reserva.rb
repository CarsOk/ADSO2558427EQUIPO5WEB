class Reserva < ApplicationRecord
  belongs_to :usuario
  belongs_to :cancha

  validates :usuario, presence: true
  validates :cancha, presence: true
  validates :fecha, presence: true
  validates :hora_inicio, presence: true
  validates :hora_fin, presence: true
end
