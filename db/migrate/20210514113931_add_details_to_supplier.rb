class AddDetailsToSupplier < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :delivery, :boolean
    add_column :suppliers, :offers, :string
  end
end
