require 'spec_helper'

describe Appointment do

	context 'validations' do

		context 'start' do
			it 'its invalid with nil start' do
				FactoryGirl.create(:appointment, start: nil).should_not be_valid
			end
		end
	end
end
