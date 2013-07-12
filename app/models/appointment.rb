class Appointment < ActiveRecord::Base
	belongs_to :patient 

	validates_presence_of :start, :end, :title, :patient_id

	after_create :set_title
	before_save :set_end

	def set_end
		self.end.DateTime.now.advance(minutes: 45)
	end

	def set_title
		self.title = 'Consulta'
	end
end
