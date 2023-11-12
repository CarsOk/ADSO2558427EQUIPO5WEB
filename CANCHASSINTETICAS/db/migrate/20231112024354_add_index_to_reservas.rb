class AddIndexToReservas < ActiveRecord::Migration[7.0]
  def change
    add_index "reservas", ["cliente_id"], name: "index_reservas_on_cliente_id"
  end
end
