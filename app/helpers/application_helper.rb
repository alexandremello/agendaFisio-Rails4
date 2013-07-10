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
	
	def format_date(date)
		date.strftime("%d/%m/%Y")
	end

	def format_time(time)
		time.strftime("%Hh%Mmin")
	end
end
