module ApplicationHelper
	def set_title(page_title)
		if !page_title.blank?
			page_title
		else
			base_title= 'Jobly'
		end
	end
end
