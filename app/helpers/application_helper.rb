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
	def check_correct_user
		unless user_profile_includes?(@language_skill)
			redirect_to user_profile_path(current_profile)
			flash[:error] = 'Couldnot delete'
		end
	end

	def build_company_profile
		@company_profile=CompanyProfile.new
    	@company_profile.build_user
    	@company_profile
	end
	def build_user_profile
		@user_profile=UserProfile.new
    	@user_profile.build_user
    	@user_profile
	end
end
