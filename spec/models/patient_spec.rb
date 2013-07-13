require 'spec_helper'

describe Patient do
	
	context 'validations' do

		context 'name' do
			it 'its invalid with nil name' do
				FactoryGirl.build(:patient, name: nil).should_not be_valid
			end

			it 'its invalid with blank name' do
				FactoryGirl.build(:patient, name: '').should_not be_valid
			end

			it 'its invalid with short name' do 
				FactoryGirl.build(:patient, name: '123').should_not be_valid
			end
		end
			
		context 'birth' do
			it 'its invalid with nil birth' do
				FactoryGirl.build(:patient, birth: nil).should_not be_valid
			end

			it 'its invalid with blank birth' do
				FactoryGirl.build(:patient, birth: '').should_not be_valid
			end
 		end
	end

	context 'methods' do
		it 'its should return the age' do
			patient = FactoryGirl.build(:patient, birth: Date.new(1986, 07, 12))
			patient.age.should == 27
		end
	end

	context 'uniqueness' do 
		it 'its invalid with no unique name' do
			FactoryGirl.create(:patient, name: 'jose')
			FactoryGirl.build(:patient, name: 'jose').should_not be_valid
		end
	end
end
