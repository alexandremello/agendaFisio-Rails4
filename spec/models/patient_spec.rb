require 'spec_helper'

describe Patient do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  it 'its invalid without a name' do
    patient = Patient.new
    patient.should_not be_valid
  end
  
  it { should respond_to(:name) }
end
