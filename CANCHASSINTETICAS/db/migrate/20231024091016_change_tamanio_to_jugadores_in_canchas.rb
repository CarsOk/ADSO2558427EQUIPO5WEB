class ChangeTamanioToJugadoresInCanchas < ActiveRecord::Migration[7.0]
  def change
    rename_column :canchas, :tamanio, :jugadores
    change_column :canchas, :jugadores, 'integer USING CAST(jugadores AS integer)'
  end
end
