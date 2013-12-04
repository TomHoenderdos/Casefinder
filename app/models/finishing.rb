class Finishing < ActiveRecord::Base
	has_many :finishingcases
	has_many :cases, :through => :finishingcases
end
