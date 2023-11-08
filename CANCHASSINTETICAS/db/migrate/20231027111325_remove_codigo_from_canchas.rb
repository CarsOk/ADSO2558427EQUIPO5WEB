class RemoveCodigoFromCanchas < ActiveRecord::Migration[7.0]
  def change
    remove_column :canchas, :codigo, :integer
  end
end
