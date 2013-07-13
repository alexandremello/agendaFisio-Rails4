class Appointment < ActiveRecord::Base
	belongs_to :patient 

	validates_presence_of :start, :end, :title, :patient_id

	before_validation :set_title, :set_end

	def set_end
		if start
			self.end = self.end || start.advance(minutes: 45)
		end
	end

	def set_title
		if !title || title.length == 0
			self.title = 'Consulta'
		end
	end
end
