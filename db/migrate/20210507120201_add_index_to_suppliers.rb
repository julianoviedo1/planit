class AddIndexToSuppliers < ActiveRecord::Migration[6.0]
  def change
    add_index :suppliers, :name
  end
end
