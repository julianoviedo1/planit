class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :phone_number

      t.timestamps
    end
  end
end
