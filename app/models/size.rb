class Size < ActiveRecord::Base
	has_many :sizecases
	has_many :cases, :through => :sizecases

	include RankedModel
	ranks :row_order
end
