require 'spec_helper'

describe User do
  context 'validations' do
    
    context 'exceptions' do

      context 'e-mail' do
        it 'it raises exception with nil e-mail' do 
          expect { FactoryGirl.create(:user, email: nil) }.to raise_error
        end

        it 'it raises exception with blank e-mail' do
          expect { FactoryGirl.create(:user, email: '') }.to raise_error
        end

        it 'it raises exception with invalid e-mail' do
          expect { FactoryGirl.create(:user, email: 'asdf.com') }.to raise_error
        end
      end

      context 'password' do
        it 'it raises exception with nil password' do
          expect { FactoryGirl.create(:user, password: nil) }.to raise_error
        end

        it 'it raises expcetion with blank password' do
          expect { FactoryGirl.create(:user, password: '')}
        end

        it 'it raises exception with short password' do
          expect { FactoryGirl.create(:user, password: '134') }.to raise_error
        end  
      end    
    end

    context 'valid record' do
      context 'e-mail' do
        it 'its invalid with nil e-mail' do
          FactoryGirl.build(:user, email: nil).should_not be_valid
        end

        it 'its invalid with blank e-mail' do 
          FactoryGirl.build(:user, email: '').should_not be_valid
        end

        it 'its invalid with invalid e-mail' do
          FactoryGirl.build(:user, email: 'asdf.com').should_not be_valid
        end
      end

      context 'password' do
        it 'its invalid with nil password' do
          FactoryGirl.build(:user, password: nil).should_not be_valid
        end

        it 'its invalid with blank password' do
          FactoryGirl.build(:user, password: '').should_not be_valid
        end

        it 'its invalid with short password' do
          FactoryGirl.build(:user, password: '123').should_not be_valid
        end
      end

      context 'uniqueness' do
        it 'its invalid with not unique e-mail' do
          FactoryGirl.create(:user, email: '123@321.com')
          FactoryGirl.build(:user, email: '123@321.com')
        end
      end
    end
  end
end
