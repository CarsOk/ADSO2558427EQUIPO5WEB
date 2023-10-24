class AddDistanciaAndImageToCanchas < ActiveRecord::Migration[7.0]
  def change
    add_column :canchas, :distancia, :string
    add_column :canchas, :image, :string
  end
end
