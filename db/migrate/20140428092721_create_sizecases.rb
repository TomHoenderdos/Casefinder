class CreateSizecases < ActiveRecord::Migration
  def up
    create_table :sizecases, :id => false do |t|
      t.integer :case_id
      t.integer :size_id

      t.timestamps
    end
  end
end
