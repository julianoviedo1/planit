class AddDetailsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :address, :string
    add_column :orders, :apartment, :string
  end
end
