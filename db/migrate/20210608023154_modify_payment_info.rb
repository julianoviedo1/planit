class ModifyPaymentInfo < ActiveRecord::Migration[6.0]
  def change
    change_column :payments, :card_number, :string
    change_column :payments, :secure_number, :string
  end
end
