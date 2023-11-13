class ChangeReservasClienteToUsuario < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservas, :cliente_id, :usuario_id
  end
end
