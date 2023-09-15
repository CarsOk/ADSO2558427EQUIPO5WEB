class CreateFacturas < ActiveRecord::Migration[6.1]
  def change
    create_table :facturas do |t|
      t.string :codigo
      t.string :fecha
      t.string :hora
      t.references :cliente, null: false, foreign_key: true
      t.references :cancha, null: false, foreign_key: true


      t.timestamps
    end
  end
end
