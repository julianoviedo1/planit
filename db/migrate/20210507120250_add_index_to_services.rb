class AddIndexToServices < ActiveRecord::Migration[6.0]
  def change
    add_index :services, :name
  end
end
