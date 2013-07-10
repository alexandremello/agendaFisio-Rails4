require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PatientsHelper. For example:
#
# describe PatientsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe PatientsHelper do
 	let(:patient) { Patient.new(name: 'jose') }
 	context 'index.html.erb' do
		
		context 'user' do
			context 'without user' do
			  
				it 'patient with no user' do
					helper.username(patient).should == 'No user'
				end
			end # context 'without user'
			
			context 'with user' do
				let(:user) { User.new(email: 'alexandre@gmail.com', password: 'a0b1c2d4e6') }
				before { patient.user = user }

				it 'patient with user' do
					helper.username(patient).should == 'alexandre@gmail.com'
				end
			end # context 'with user'
		end # context 'user'
		
		context 'exam' do
			let(:exam) { Exam.new(date: '2013-07-10') }

			it 'patient has no exams' do
				patient = Patient.new
				helper.last_exam(patient).should == 'No exams'
			end

			context 'with exam' do
				before { exam.patient = patient }

				xit 'patient last exam' do
					helper.last_exam(patient).should == '10/07/2013'
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
