class Reserva < ApplicationRecord
  belongs_to :cliente
  belongs_to :cancha

  validates :cliente, presence: true
  validates :cancha, presence: true
  validates :fecha, presence: true
  validates :hora_inicio, presence: true
  validates :hora_fin, presence: true

end
