class RemoveValoracionIdFromComentarios < ActiveRecord::Migration[7.0]
  def change
    remove_column :comentarios, :valoracion_id, :bigint
  end
end
