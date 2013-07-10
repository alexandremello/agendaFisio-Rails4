module PatientsHelper

	def user
		# retirar o if do link_to username
	end

	def username(patient)
		if patient.user
			patient.user.email
		else
			'No user'
		end
	end

	def last_exam(patient)
		exam = patient.exams.order("date desc").first()
		if exam
			exam.date_formated
		else
			'No exams'
		end
	end

	def last_appointment(patient)
		appointment = patient.appointments.where("start < ?", Time.now).order("start desc").first()
		if appointment
			appointment.start_date
		else
			'No prior appointments'
		end
	end

	def next_appointment(patient)
		appointment = patient.appointments.where("start > ?", Time.now).order("start").first()
		if appointment
			appointment.start_date
		else
			'No next appointment'
		end
	end

end
