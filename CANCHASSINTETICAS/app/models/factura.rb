class Factura < ApplicationRecord
  belongs_to :cliente
  belongs_to :cancha

end
