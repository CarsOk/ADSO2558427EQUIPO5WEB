class Cancha < ApplicationRecord
    has_many :reservas
    has_and_belongs_to_many :clientes
end
