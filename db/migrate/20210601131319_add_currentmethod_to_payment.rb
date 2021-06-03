class AddCurrentmethodToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :current_method, :boolean
  end
end
