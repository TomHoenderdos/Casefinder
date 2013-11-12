class CreateDevicecases < ActiveRecord::Migration
  def up
    create_table :devicecases, :id => false do |t|
    	t.column :case_id, :integer
    	t.column :device_id, :integer
    end
  end
end
