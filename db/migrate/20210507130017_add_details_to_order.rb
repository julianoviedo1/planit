class AddDetailsToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :home_delivery, :boolean
  end
end
