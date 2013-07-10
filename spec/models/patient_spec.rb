require 'spec_helper'

describe Patient do
	let(:patient) { Patient.new()}
  
  it 'its invalid without a name' do
    patient.should_not be_valid
  end
  
  it { should respond_to(:name) }

  context 'methods' do
		before { patient.birth = '1986/07/10' }

		it { patient.age.should == 27 }
	end
end
