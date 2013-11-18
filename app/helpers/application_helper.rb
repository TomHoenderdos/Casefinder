module ApplicationHelper
	def nav_helper(arg)
	  controller_name == arg ? "current" : ""
	end

	def cp(path)
  		"hidden" if current_page?(path)
	end
end
