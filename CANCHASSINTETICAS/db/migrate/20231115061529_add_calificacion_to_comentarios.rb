class AddCalificacionToComentarios < ActiveRecord::Migration[7.0]
  def change
    add_column :comentarios, :calificacion, :integer
  end
end
