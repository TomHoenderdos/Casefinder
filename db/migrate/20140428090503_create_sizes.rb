class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :size
      t.integer :row_order

      t.timestamps
    end
  end
end
