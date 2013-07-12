require 'spec_helper'

describe Appointment do

	context 'validations' do

		context 'start' do
			it 'its invalid with nil start' do
				FactoryGirl.build(:appointment, start: nil).should_not be_valid
			end

			it 'its invalid with blank start' do
				FactoryGirl.build(:appointment, start: '').should_not be_valid
			end
		end

		context 'end' do
			it 'its invalid with nil end' do
				FactoryGirl.build(:appointment, end: nil).should_not be_valid
			end

			it 'its invalid with blank end' do
				FactoryGirl.build(:appointment, end: '').should_not be_valid
			end
		end

		context 'title' do
			it 'its invalid with nil title' do
				FactoryGirl.build(:appointment, title: nil).should_not be_valid
			end

			it 'its invalid with blank title' do
				FactoryGirl.build(:appointment, title: '').should_not be_valid
			end
		end

		context 'patient_id' do

		end
	end

	context 'hooks' do
		context 'after_create' do
			it 'Title should be Consulta' do
				FactoryGirl.build(:appointment).title.should == 'Consulta'
			end
		end
	end
end
