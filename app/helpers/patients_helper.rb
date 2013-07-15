module PatientsHelper

	def user
		# retirar o if do link_to username
	end

	def username(patient)
		if patient.user
			link_to patient.user.email, edit_patient_user_path(patient, patient.user)
		else
			link_to 'No user', new_patient_user_path(patient)
		end
	end

	def last_exam(patient)
		exam = patient.exams.order("date desc").first()
		if exam
			exam.date
		else
			'No exams'
		end
	end

	def last_appointment(patient)
		appointment = patient.appointments.where("start < ?", DateTime.now).order("start desc").first()
		if appointment
			appointment.start
		else
			'No prior appointments'
		end
	end

	def next_appointment(patient)
		appointment = patient.appointments.where("start > ?", DateTime.now).order("start").first()
		if appointment
			appointment.start
		else
			'No next appointment'
		end
	end

end
