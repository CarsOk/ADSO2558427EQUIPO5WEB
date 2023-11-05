class CreateValoraciones < ActiveRecord::Migration[7.0]
  def change
    create_table :valoraciones do |t|
      t.integer :calificacion
      t.text :comentario

      t.timestamps
    end
  end
end
