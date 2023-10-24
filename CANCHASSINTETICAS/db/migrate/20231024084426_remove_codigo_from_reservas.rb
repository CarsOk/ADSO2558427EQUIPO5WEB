class RemoveCodigoFromReservas < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservas, :codigo
  end
end
