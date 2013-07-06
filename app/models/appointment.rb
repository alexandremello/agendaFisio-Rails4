class Appointment < ActiveRecord::Base
	belongs_to :patient

	def start_date
		self.start.strftime("%d/%m/%Y")
	end

	def start_hour
		self.start.strftime("%Hh%Mmin")
	end

	def end_date
		self.start.strftime("%d/%m/%Y")
	end

	def end_hour
		self.start.strftime("%Hh%Mmin")
	end
end
