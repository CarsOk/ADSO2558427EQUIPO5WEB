class RemoveUsuarioIdFromClientes < ActiveRecord::Migration[7.0]
  def change
    remove_column :clientes, :usuario_id
  end
end
