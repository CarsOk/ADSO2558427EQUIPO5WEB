class AddUsuarioRefToComentarios < ActiveRecord::Migration[7.0]
  def change
    add_reference :comentarios, :usuario, null: false, foreign_key: true
  end
end
