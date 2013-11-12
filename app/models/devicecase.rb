class Devicecase < ActiveRecord::Base
	belongs_to :case
	belongs_to :device
end
