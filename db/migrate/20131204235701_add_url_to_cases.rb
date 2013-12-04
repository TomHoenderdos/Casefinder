class AddUrlToCases < ActiveRecord::Migration
  def change
    add_column :cases, :url, :string
  end
end
