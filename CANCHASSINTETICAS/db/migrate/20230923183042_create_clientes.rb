class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.integer :identificacion
      t.string :nombre
      t.string :apellido
      t.string :telefono

      t.timestamps
    end
  end
end
