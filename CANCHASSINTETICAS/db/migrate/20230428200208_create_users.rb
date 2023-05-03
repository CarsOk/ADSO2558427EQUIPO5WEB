class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.integer :identificacion
      t.integer :telefono

      t.timestamps
    end
  end
end
