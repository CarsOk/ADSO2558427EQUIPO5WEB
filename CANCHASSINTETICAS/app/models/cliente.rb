class Cliente < ApplicationRecord
    has_many :reservas
    has_and_belongs_to_many :canchas
end
