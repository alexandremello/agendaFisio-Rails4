require 'spec_helper'

describe PatientsHelper do
	let(:patient) 			{ FactoryGirl.create(:patient) }
	let(:patient_with_user) { FactoryGirl.create(:patient_with_user) }
	let(:patient_with_exam) { FactoryGirl.create(:patient) }
	context 'index.html.erb' do
		context 'user' do
			context 'without user' do
				it 'patient with no user' do
					helper.username(patient).should == 'No user'
				end
			end # context 'without user'
			
			context 'with user' do
				it 'patient with user' do
					helper.username(patient_with_user).should == patient_with_user.user.email
				end
			end # context 'with user'
		end # context 'user'
		
		context 'exam' do
			it 'patient has no exams' do
				patient = Patient.new
				helper.last_exam(patient).should == 'No exams'
			end

			context 'with exam' do
				it 'patient last exam' do
					FactoryGirl.create(:exam, date: Date.today, patient: patient_with_exam)
					3.times { FactoryGirl.create(:exam, patient: patient_with_exam) }
					helper.last_exam(patient_with_exam).should == Date.today.strftime("%d/%m/%Y")
				end
			end # context 'with exam'
		end # context 'exam'

		context 'appointment' do
			context 'without appointment' do
				xit 'patient with no appointment' do

				end
			end # context 'without appointment'

			context 'with appointment' do
				xit 'patient with appointment' do

				end
			end # context 'with appointment'
		end # context 'appointment'
	end # context 'index.html.erb'
end
