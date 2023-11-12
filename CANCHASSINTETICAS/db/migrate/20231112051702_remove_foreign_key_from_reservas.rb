class RemoveForeignKeyFromReservas < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :reservas, :clientes
  end
end
