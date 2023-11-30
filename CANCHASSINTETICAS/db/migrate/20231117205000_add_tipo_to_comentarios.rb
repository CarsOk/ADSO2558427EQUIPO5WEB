class AddTipoToComentarios < ActiveRecord::Migration[7.0]
  def change
    add_column :comentarios, :tipo, :string
  end
end
