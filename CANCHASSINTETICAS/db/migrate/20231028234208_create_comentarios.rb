class CreateComentarios < ActiveRecord::Migration[7.0]
  def change
    create_table :comentarios do |t|
      t.text :contenido
      t.references :valoracion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
