class AddAdminToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :admin, :boolean, default: false
  end
end
