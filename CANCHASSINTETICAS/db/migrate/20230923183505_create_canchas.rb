class CreateCanchas < ActiveRecord::Migration[7.0]
  def change
    create_table :canchas do |t|
      t.integer :codigo
      t.string :nombre
      t.string :tamanio
      t.string :precio

      t.timestamps
    end
  end
end
