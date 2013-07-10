module AppointmentsHelper

	def format_date(date)
		date.strftime("%d/%m/%Y")
	end

	def format_time(time)
		time.strftime("%Hh%Mmin")
	end

end
