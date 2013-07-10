module ApplicationHelper

	def nav_items
		if user_signed_in?
			if current_user.admin?
				render "nav_admin" 
			else
				render "nav_user"
			end				
		end
	end
	
end
