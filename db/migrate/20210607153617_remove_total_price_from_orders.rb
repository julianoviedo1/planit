class RemoveTotalPriceFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :total_price, :integer
  end
end
