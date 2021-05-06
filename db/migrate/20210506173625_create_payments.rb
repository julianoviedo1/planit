class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :payment_type
      t.bigint :card_number

      t.timestamps
    end
  end
end
