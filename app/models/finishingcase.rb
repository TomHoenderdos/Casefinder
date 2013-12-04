class Finishingcase < ActiveRecord::Base
	belongs_to :case
	belongs_to :finishing
end
