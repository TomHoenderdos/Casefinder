class Device < ActiveRecord::Base
	has_many :devicecases
	has_many :cases, :through => :devicecases
end
