class CreateFinishings < ActiveRecord::Migration
  def change
    create_table :finishings do |t|
      t.string :name
      t.string :search_string
    end
  end
end
