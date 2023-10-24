class AddCodigoToCanchas < ActiveRecord::Migration[7.0]
  def change
    add_column :canchas, :codigo, :integer
  end
end
