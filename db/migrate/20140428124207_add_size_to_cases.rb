class AddSizeToCases < ActiveRecord::Migration
  def change
    add_column :cases, :size, :string
  end
end
