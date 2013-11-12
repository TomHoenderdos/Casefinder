class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :name
      t.string :description
      t.string :color
      t.string :product_type
      t.string :material
      t.string :finishing
      t.string :picture
    end
  end
end
