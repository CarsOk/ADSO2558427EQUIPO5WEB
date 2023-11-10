class AddFieldsToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :identificacion, :integer
    add_column :usuarios, :nombre, :string
    add_column :usuarios, :apellido, :string
  end
end
