class CreateFinishingcases < ActiveRecord::Migration
  def change
    create_table :finishingcases, :id => false do |t|
    	t.column :case_id, :integer
    	t.column :finishing_id, :integer
    end
  end
end