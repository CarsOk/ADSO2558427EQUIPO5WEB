class AddImagenToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :imagen, :text
  end
end
