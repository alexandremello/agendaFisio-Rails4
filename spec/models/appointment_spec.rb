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

		context 'patient_id' do

		end
	end

	context 'callbacks' do
		context 'before_validation' do
			context 'title' do
				it 'title should be Consulta' do
					FactoryGirl.create(:appointment).title.should == 'Consulta'
				end

				it 'its valid with nil title' do
					FactoryGirl.build(:appointment, title: nil).should be_valid
				end

				it 'its valid with blank title' do
					FactoryGirl.build(:appointment, title: '').should be_valid
				end

				it 'its title should not be altered if set' do
					ap = FactoryGirl.build(:appointment, title: 'retorno')
					ap.valid?
					ap.title.should == 'retorno'
				end
			end

			context 'end' do
				it 'end should be start + 45min' do
					ap = FactoryGirl.create(:appointment)
					ap.valid?
					ap.end.should == ap.start.advance(minutes: 45)
				end

				it 'its valid with nil end' do
					FactoryGirl.build(:appointment, end: nil).should be_valid
				end

				it 'its valid with blank end' do
					FactoryGirl.build(:appointment, end: '').should be_valid
				end

				it 'end should not be altered if set' do
					ap = FactoryGirl.build(:appointment, end: DateTime.new(2013, 07, 10, 10, 00, 00, '-3'))
					ap.valid?
					ap.end.should == DateTime.new(2013, 07, 10, 10, 00, 00, '-3')
				end
			end
		end
	end
end
