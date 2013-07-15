require 'spec_helper'

describe Exam do
	context 'validations' do
		context 'date' do
			it 'its invalid with nil date' do 
				FactoryGirl.build(:exam, date: nil).should_not be_valid
			end

			it 'its invalid with blank date' do
				FactoryGirl.build(:exam, date: '').should_not be_valid
			end
		end

		context 'patient' do 
			it 'its invalid with nil patient_id' do
				FactoryGirl.build(:exam, patient_id: nil).should_not be_valid
			end

			it 'its invalid with blank patient_id' do
				FactoryGirl.build(:exam, patient_id: '').should_not be_valid
			end
		end
	end
end
