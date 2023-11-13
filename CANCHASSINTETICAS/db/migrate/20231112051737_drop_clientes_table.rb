class DropClientesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :clientes
  end
end
