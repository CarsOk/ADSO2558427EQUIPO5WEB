class ChangePrecioTypeInCanchas < ActiveRecord::Migration[7.0]
  def change
    change_column :canchas, :precio, 'float USING CAST(precio AS float)'
  end
end
