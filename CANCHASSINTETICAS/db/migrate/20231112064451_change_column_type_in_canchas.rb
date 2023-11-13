class ChangeColumnTypeInCanchas < ActiveRecord::Migration[7.0]
  def change
    change_column :canchas, :image, :text
  end
end
