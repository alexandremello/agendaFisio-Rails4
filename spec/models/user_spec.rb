require 'spec_helper'

describe User do
  let(:user) { User.create }
  subject { user }
  
  it 'its invalid without e-mail' do
    should_not be_valid
  end
  
  it 'its invalid without password' do
    user.email = 'contact@alexandre-mello-pro'
    user.should_not be_valid
  end

  it 'its invalid with a shot password' do
    user.email = 'contact@alexandr-mello.pro'
    user.password = 'oi'
    user.should_not be_valid
  end
  
  it { should respond_to(:admin) }
end
