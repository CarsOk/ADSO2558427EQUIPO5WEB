class Reserva < ApplicationRecord
  belongs_to :cancha
  belongs_to :cliente
end
