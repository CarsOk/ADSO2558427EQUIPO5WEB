class AddDuracionEnHorasToReservas < ActiveRecord::Migration[7.0]
  def change
    add_column :reservas, :duracion_en_horas, :float
  end
end
