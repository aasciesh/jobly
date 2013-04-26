module ApplicationHelper
	def set_title(page_title)
		if !page_title.blank?
			page_title
		else
			base_title= 'Jobly'
		end
	end
	
	def user_profile_includes?(item)
		item_name_plurified= item.class.name.underscore.pluralize
		current_profile.send(item_name_plurified).includes?(item)
		
	end
	def user_profile_include?(item)
		item_name_= item.class.name.underscore
		current_profile.send(item_name_)== item
	end
	def company_profile_includes?(item)
		item_name_plurified= item.class.name.underscore.pluralize
		current_profile.send(item_name_plurified).includes?(item)
	end
	def company_profile_include?(item)
		item_name_= item.class.name.underscore.pluralize
		current_profile.send(item_name_) == item
	end
	def corerct_user?(user_profile)
		current_user.profile == user_profile
	end 
end
