class AddDetailsToSupplier < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :delivery, :boolean
    add_column :suppliers, :offers, :string
    add_column :suppliers, :opens_at, :integer
    add_column :suppliers, :close_at, :integer
  end
end
