class ChangeColumnType < ActiveRecord::Migration[6.1]
  def change
   change_column :usuarios, :num_identificacion, :string
  end
end
