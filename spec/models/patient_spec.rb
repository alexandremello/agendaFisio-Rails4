require 'spec_helper'

describe Patient do
  
  it 'its invalid without a name' do
    patient = Patient.new
    patient.should_not be_valid
  end
  
  it { should respond_to(:name) }
end
