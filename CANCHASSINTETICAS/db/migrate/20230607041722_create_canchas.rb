class CreateCanchas < ActiveRecord::Migration[6.1]
  def change
    create_table :canchas do |t|
      t.string :nombre
      t.string :tamanio

      t.timestamps
    end
  end
end
