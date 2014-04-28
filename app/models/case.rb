class Case < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
	has_many :devicecases
	has_many :finishingcases
	has_many :sizecases

	has_many :finishings, :through => :finishingcases
	has_many :devices, :through => :devicecases
	accepts_nested_attributes_for :devicecases
	has_many :sizes, :through => :sizecases
	accepts_nested_attributes_for :sizecases
end
