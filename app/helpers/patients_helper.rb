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
			format_date(exam.date)
		else
			'No exams'
		end
	end

	def last_appointment(patient)
		appointment = patient.appointments.where("start < ?", Time.now).order("start desc").first()
		if appointment
			format_date(appointment.start)
		else
			'No prior appointments'
		end
	end

	def next_appointment(patient)
		appointment = patient.appointments.where("start > ?", Time.now).order("start").first()
		if appointment
			format_date(appointment.start)
		else
			'No next appointment'
		end
	end

end
