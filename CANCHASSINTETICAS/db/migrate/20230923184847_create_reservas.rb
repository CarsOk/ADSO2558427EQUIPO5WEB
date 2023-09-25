class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.integer :codigo
      t.date :fecha
      t.time :hora_inicio
      t.time :hora_fin
      t.references :cancha, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
