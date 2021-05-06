class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.integer :quantity
      t.integer :total_price
      t.date :delivery_date
      t.string :comments
      t.string :hourly_range
      t.integer :status

      t.timestamps
    end
  end
end
