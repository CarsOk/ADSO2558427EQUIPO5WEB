class AddPrecioToReservas < ActiveRecord::Migration[7.0]
  def change
    add_column :reservas, :precio, :float
  end
end
