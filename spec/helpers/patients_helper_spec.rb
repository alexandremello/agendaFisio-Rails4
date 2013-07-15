require 'spec_helper'

describe PatientsHelper do
	let(:patient) 			{ FactoryGirl.create(:patient) }
	let(:patient_with_user) { FactoryGirl.create(:patient_with_user) }
	
	let(:patient_with_appointment) { FactoryGirl.create(:patient) }
	context 'index.html.erb' do
		context 'user' do
			context 'without user' do
				it 'patient with no user' do
					helper.username(patient).should == (link_to 'No user', new_patient_user_path(patient))
				end
			end # context 'without user'
			
			context 'with user' do
				it 'patient with user' do
					helper.username(patient_with_user).should == (link_to patient_with_user.user.email, edit_patient_user_path(patient_with_user, patient_with_user.user))
				end
			end # context 'with user'
		end # context 'user'
		
		context 'exam' do
			let(:patient_with_exam) { FactoryGirl.create(:patient) }
			it 'patient has no exams' do
				patient = Patient.new
				helper.last_exam(patient).should == 'No exams'
			end

			it 'patient last exam' do
				FactoryGirl.create(:exam, date: Date.today, patient: patient_with_exam)
				3.times { FactoryGirl.create(:exam, patient: patient_with_exam) }
				helper.last_exam(patient_with_exam).should == Date.today
			end
		end # context 'exam'

		context 'appointment' do
			context 'Last Appointment' do
				it 'patient has no appointments' do
					helper.last_appointment(patient).should == 'No prior appointments'
				end

				it 'patient has only prior appointments' do
					3.times { FactoryGirl.create(:appointment, patient: patient_with_appointment) }
					helper.last_appointment(patient_with_appointment).strftime("%Y%m%d%H%M").should == (DateTime.now - 1).strftime("%Y%m%d%H%M")
				end

				it 'patient has only next appointments' do
					3.times { FactoryGirl.create(:appointment_next, patient: patient_with_appointment) }
					helper.last_appointment(patient_with_appointment).should == 'No prior appointments'
				end

				it 'patient has next appointments' do
					3.times { FactoryGirl.create(:appointment_prior, patient: patient_with_appointment) }
					FactoryGirl.create(:appointment, start: DateTime.yesterday, patient: patient_with_appointment)
					3.times { FactoryGirl.create(:appointment_next, patient: patient_with_appointment) }
					helper.last_appointment(patient_with_appointment).strftime("%Y%m%d%H%M").should == (DateTime.now - 1).strftime("%Y%m%d%H%M")
				end
			end # context "Last Appointment"

			context 'Next Appointment' do
				it 'patient has no appointments' do
					helper.next_appointment(patient).should == 'No next appointment'
				end

				it 'patient has only prior appointments' do
					3.times { FactoryGirl.create(:appointment_prior, patient: patient_with_appointment) }
					helper.next_appointment(patient_with_appointment).should == 'No next appointment'
				end

				it 'patient has only next appointments' do
					patient_with_appointment.exams.clear
					3.times { FactoryGirl.create(:appointment_next, patient: patient_with_appointment) }
					FactoryGirl.create(:appointment, start: (DateTime.now + 1), patient: patient_with_appointment)
					helper.next_appointment(patient_with_appointment).strftime("%Y%m%d%H%M").should == (DateTime.now + 1).strftime("%Y%m%d%H%M")
				end

				it 'patient has prior appointments' do
					patient_with_appointment.exams.clear
					3.times { FactoryGirl.create(:appointment_prior, patient: patient_with_appointment) }
					FactoryGirl.create(:appointment, start: (DateTime.now + 1), patient: patient_with_appointment)
					3.times { FactoryGirl.create(:appointment_next, patient: patient_with_appointment) }
					helper.next_appointment(patient_with_appointment).strftime("%Y%m%d%H%M").should == (DateTime.now + 1).strftime("%Y%m%d%H%M")
				end
			end # context 'Next Appointment'
		end # context 'appointment'
	end # context 'index.html.erb'
end
