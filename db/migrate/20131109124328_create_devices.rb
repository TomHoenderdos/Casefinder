class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :full_name
      t.string :brand
      t.integer :row_order
    end
  end
end
