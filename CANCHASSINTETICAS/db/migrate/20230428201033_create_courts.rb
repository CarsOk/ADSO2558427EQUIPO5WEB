class CreateCourts < ActiveRecord::Migration[6.1]
  def change
    create_table :courts do |t|
      t.integer :tamaño
      t.string :fecha
      t.integer :hora

      t.timestamps
    end
  end
end
