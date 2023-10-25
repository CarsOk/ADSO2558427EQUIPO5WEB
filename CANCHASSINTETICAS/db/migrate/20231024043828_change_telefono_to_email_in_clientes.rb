class ChangeTelefonoToEmailInClientes < ActiveRecord::Migration[7.0]
  def change
    rename_column :clientes, :telefono, :email
  end
end
