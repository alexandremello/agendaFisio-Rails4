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
		if date.kind_of? String 
			date
		else
			date.strftime("%d/%m/%Y")
		end
	end

	def format_time(time)
		if time.kind_of? String
			time
		else
			time.strftime("%Hh%Mmin")
		end
	end
end
