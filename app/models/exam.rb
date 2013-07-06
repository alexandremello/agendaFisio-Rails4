class Exam < ActiveRecord::Base
	belongs_to :patient

	def date_formated
		self.date.strftime("%d/%m/%Y")
	end
end
