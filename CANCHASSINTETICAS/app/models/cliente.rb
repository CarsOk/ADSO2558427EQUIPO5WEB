class Cliente < ApplicationRecord
    has_many :reservas
    has_and_belongs_to_many :canchas
    belongs_to :usuario
end
