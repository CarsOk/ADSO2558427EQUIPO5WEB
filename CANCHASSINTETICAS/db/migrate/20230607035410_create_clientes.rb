class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.string :identificacion
      t.string :nombre
      t.string :apellido
      t.string :telefono

      t.timestamps
    end
  end
end
