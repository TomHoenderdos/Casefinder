class Device < ActiveRecord::Base

	has_many :devicecases
	has_many :cases, :through => :devicecases
	
	include RankedModel
	ranks :row_order

end
