class AddUsuarioToCliente < ActiveRecord::Migration[7.0]
  def change
    add_reference :clientes, :usuario, foreign_key: true
  end
end
