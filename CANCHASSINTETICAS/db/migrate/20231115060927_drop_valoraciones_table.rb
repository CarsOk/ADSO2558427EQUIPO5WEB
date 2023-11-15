class DropValoracionesTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :valoraciones
  end
end
